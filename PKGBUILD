# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.4.3
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space (static libraries)'
url='https://github.com/libbpf/libbpf'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc' 'libelf' 'linux-api-headers' "${_pkgname}=${pkgver}-${pkgrel}")
makedepends=('rsync')
provides=('libbpf.a')
options=('staticlibs')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz
        "add-install-static-target.patch")
sha512sums=('d03965f8abeaac840cda28fdacf9df378869fa6e5ef45d992fc5398bed5970ebedb24f20676b1779f8941b4b912bb691948e198eff87ea1d5d8e5cd95d6e06d1'
            '8cbbef9233029e89688dfc7b29f5626de8a87ee0294e3cf4f674cc98798029268f325141b485f4d0729f9769555c0f713aa66f6d58267a96249dd643f41d9963')
b2sums=('a5440a6ba64cf5f0783ec49e3e1f13badf9fc7acc4c3ffd2ec9a499b68fb668a0b9ca9fa482d53d2e0f3d698ffe4e251e5159d668d9e41fab066912553196a81'
        'c63de3ef270515aaf1d452c5f74e36509859066f240cb0c4f92b049d67b5cbd74272b47c61762b7a3078a48108febf737cc5a880550d835dc528899ddea92533')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for f in "${source[@]}"; do
    if test "${f##*.}" = "patch"; then
      msg "Applying: ${f}"
      patch -Np1 -i "${srcdir}/${f}"
    fi
  done
}

build() {
  cd ${_pkgname}-${pkgver}
  make -C src BUILD_STATIC_ONLY=1
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C src BUILD_STATIC_ONLY=1 DESTDIR="${pkgdir}" LIBSUBDIR=lib install_static
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:


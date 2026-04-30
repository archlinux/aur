# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.7.0
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
sha512sums=('29996f76d45222070b7554c1a098d67cf0933876a0fb3965800a304239a7e8dcc4d2ecc3ffe049dfbebe62e29e12cca793c6b22d5845955dd17faff5786691dd'
            '8cbbef9233029e89688dfc7b29f5626de8a87ee0294e3cf4f674cc98798029268f325141b485f4d0729f9769555c0f713aa66f6d58267a96249dd643f41d9963')
b2sums=('e1bfc94bf90aa566bbdad55384bcf4f365e1f1619f83d45285e3596700c393cda054462c78938ff268483ad534f59df177ce29629c565a99069f793b4857bd18'
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


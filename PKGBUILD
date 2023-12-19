# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.3.0
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
sha512sums=('59990189538e47765542e9ed6e88bc78c9d29bc077b5666bb1303cf15579c90b3d35a0d631b9bbd4bff2708243dc91d901bd68c119fb74dfd10a3e1066aa9acc'
            '8cbbef9233029e89688dfc7b29f5626de8a87ee0294e3cf4f674cc98798029268f325141b485f4d0729f9769555c0f713aa66f6d58267a96249dd643f41d9963')
b2sums=('5ee0a45cd06be482c9523ec2a9bb26cf12b89df23f515b037badda868770069d5ffb751c011222b86b1d43034a1cdd537cb263883ed0645641548adc9c9896eb'
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


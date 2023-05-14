# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.2.0
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
sha512sums=('b5291e807a3c83cb80a47e3518a3ab5ad0b0e6157842117c0684c32e525dce0cca199c3c9028390b94a73ff968391aa023312d3b8bd7472aff1c9ee5206c424e'
            '541fbc6b6e043f828fb9b4716a5d4093c0d3900d9039482a627fc07f6f06d9c8bfc7cd10d6e10e55dde81c075caaa37425dc095152f399944995350014de650f')
b2sums=('cd10fd9133f01d3f8dbd5ed4585e5605c3b9fb0d9f6ee76a49dcb61a0555edfeb85e333f7b8eb069f47a65d0ab24dcdc33502bd660378cd662a366f10de627a4'
        'b9bceaf2abbb33597e242a4c20716196c677ee989997b47b3f6e9f62d91621b163cbe2ea3a5024e823ed9fdbb7bf9db84d95291bf466fb0454563b93d80425ba')

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


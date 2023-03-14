# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.1.0
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
sha512sums=('751126893883c68e5472724988327e03f7f52becd472f7d6239fa838762f857e54a0347f8f824b8c32ca93b8f419310a86e1d75e3646dae72c2d2992d093b828'
            '541fbc6b6e043f828fb9b4716a5d4093c0d3900d9039482a627fc07f6f06d9c8bfc7cd10d6e10e55dde81c075caaa37425dc095152f399944995350014de650f')
b2sums=('70bee4e94c3b372501e1697cec6573fb3292e61236ed210bde4c3a838494cc951571d7c47720c28a47b8e038331775d66d3f4ad24423f5102e1ee708d1981f88'
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


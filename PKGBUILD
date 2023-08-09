# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.2.2
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
sha512sums=('bc7620207e6f521b9b5baab00bd81346084b8eabf81bff3ec24e5367d389f2a331a0b082798f8bb5d4fea836c3c0cc961fc881abc3a4e05d91152150bdfe47be'
            '541fbc6b6e043f828fb9b4716a5d4093c0d3900d9039482a627fc07f6f06d9c8bfc7cd10d6e10e55dde81c075caaa37425dc095152f399944995350014de650f')
b2sums=('45a2ceabd38b3ea55f466de68d0806df6ae802b509063ca12d670ba972bac3dc5c7e518e8c9904915dbc9877c27ea892a7b857aa03d4e86016969b2d278b0b4a'
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


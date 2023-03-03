# Maintainer: Dan Fuhry <dan@fuhry.com>

_pkgname=libbpf
pkgname=${_pkgname}-static
pkgver=1.0.1
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
sha512sums=('2ee6d85c0a33f723e5b93ddddf97118e67754c9e44ca0449ceb49126820f89fea9ddc282a5add764dc4da090af6164cc6641b497489253d192ed01bc397df9be'
            '541fbc6b6e043f828fb9b4716a5d4093c0d3900d9039482a627fc07f6f06d9c8bfc7cd10d6e10e55dde81c075caaa37425dc095152f399944995350014de650f')
b2sums=('24e43f9a2b20e6f708b74ff50c8ce243546681201b1d72d6b35a95dd85b59032069814792739d3b2a6adaa007958a142a687e901e36a193fd02cdca69926d08f'
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


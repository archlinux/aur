# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2 ft=bash et

_pkgname=faup
pkgname=${_pkgname}-git
pkgver=r519.g8a736da
pkgrel=1
pkgdesc='Fast URL decoder library and utility'
url='https://github.com/stricaud/faup'
license=('custom')
arch=('x86_64')
makedepends=('git' 'cmake')
conflicts=('faup')
provides=('faup')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  mkdir build
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dvm644 "${srcdir}/${_pkgname}/LICENSE" -t \
    "${pkgdir}/usr/share/license/${_pkgname}"
}

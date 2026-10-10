# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=hidapitester-git
_pkgname=hidapitester
pkgver=0.7.r4.gd777f15
pkgrel=1
pkgdesc='Simple command-line program to test HIDAPI'
arch=('x86_64' 'aarch64')
url='https://github.com/todbot/hidapitester'
license=('GPL-3.0-only')
depends=('glibc' 'hidapi')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -Wno-dev
  cmake --build build
}

check() {
  sh "${_pkgname}/tests/test_nohardware.sh" build/hidapitester
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:

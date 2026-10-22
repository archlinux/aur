# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>
pkgname=rossat-swarm-git
_pkgname=rossat-swarm
pkgver=1.0.0.r1.gdffde2e
pkgrel=1
pkgdesc="Open re-implementation of ROCCAT Swarm (GUI, CLI, library) for the Kone AIMO Remastered (git version)"
arch=('x86_64')
url="https://github.com/TheElevatedOne/rossat-swarm"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'hidapi' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libayatana-appindicator')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S "${_pkgname}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}/docs/PROTOCOL.md" "${pkgdir}/usr/share/doc/${_pkgname}/PROTOCOL.md"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

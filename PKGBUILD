# Maintainer Chris Werner Rau <aur@cwrau.io>
# Contributor: Gustavo Castro < gustawho [ at ] disroot [ dot ] org >

pkgname=qtemu-git
pkgver=2.1.r26.gd6c2d66
pkgrel=3
pkgdesc="Qt5 GUI front-end for QEMU, similar to VirtualBox."
url="https://gitlab.com/qtemu/gui"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'qt6-svg')
depends=('qemu' 'qt6-base')
conflicts=('qtemu')
source=($pkgname::"git+https://gitlab.com/qtemu/gui.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLIB_INSTALL_DIR=lib -B build -S "$pkgname"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
  install -Dm644 "${srcdir}/$pkgname"/qtemu.desktop "${pkgdir}"/usr/share/applications/qtemu.desktop
  install -Dm644 "${srcdir}/$pkgname/qtemu.png" "${pkgdir}/usr/share/pixmaps/qtemu.png"
}

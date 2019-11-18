# Maintainer: Chris Werner Rau < aur [ at ] cwrau [ dot ] io >
# Contributor: Gustavo Castro < gustawho [ at ] disroot [ dot ] org >

pkgname=qtemu-git
pkgver=r247.d230e82
pkgrel=1
pkgdesc="Qt5 GUI front-end for QEMU, similar to VirtualBox."
url="https://gitlab.com/qtemu/gui"
license=("GPL2")
arch=('i686' 'x86_64')
makedepends=('git')
depends=('qemu' 'qt5-base')
conflicts=('qtemu')
source=($pkgname::"git+https://gitlab.com/qtemu/gui.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/$pkgname"
  if ! [ -d build ]
  then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/$pkgname/build"
  qmake-qt5  \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    ../qtemu.pro
  make
}

package() {
  cd "${srcdir}/$pkgname/build"
  install -Dm644 "${srcdir}/$pkgname"/qtemu.desktop "${pkgdir}"/usr/share/applications/qtemu.desktop
  install -Dm644 "${srcdir}/$pkgname/qtemu.png" "${pkgdir}/usr/share/pixmaps/qtemu.png"
  install -Dm755 qtemu "${pkgdir}/usr/bin/qtemu"
}

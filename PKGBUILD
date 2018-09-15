# Maintainer: Gustavo Castro < gustawho [ at ] disroot [ dot ] org >

pkgname=qtemu-git
_gitname=Qtemu
pkgver=r154.42fc907
pkgrel=1
pkgdesc="Qt5 GUI front-end for QEMU, similar to VirtualBox."
url="http://qtemu.org"
license=("GPL2")
arch=('i686' 'x86_64')
makedepends=('cmake')
depends=('qemu' 'qt5-base')
conflicts=('qtemu')
source=("git+https://gitlab.com/carlavilla/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/$_gitname"
  mkdir build
}

build() {
  cd "${srcdir}/$_gitname/build"
  qmake-qt5  \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    ../qtemu.pro
  make
}

package() {
  cd "${srcdir}/$_gitname/build"
  install -Dm644 "${srcdir}/$_gitname"/qtemu.desktop "${pkgdir}"/usr/share/applications/qtemu.desktop
  install -Dm644 "${srcdir}/$_gitname/qtemu.png" "${pkgdir}/usr/share/pixmaps/qtemu.png"
  install -Dm755 qtemu "${pkgdir}/usr/bin/qtemu"
}

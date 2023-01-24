# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=libqt6xdg
pkgname=$_pkgname-git
pkgver=3.10.0.6.ga36b76d
pkgrel=1
pkgdesc="Library providing freedesktop.org specs implementations for Qt."
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("LGPL2.1")
depends=("qt6-base" "qt6-svg")
makedepends=("git" "cmake" "qt6-tools" "lxqt-build-tools-qt6-git")
checkdepends=("xorg-server-xvfb")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/lxqt/libqtxdg.git#branch=wip_qt6")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DQTXDG_INSTALL_DEFAPPS_CONFIG=OFF \
    -DBUILD_TESTS=ON
  make
}

check() {
  cd build

  xvfb-run make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Maintainer: Faheem Pervez < trippin1 gmail >

pkgname=colord-kde-git
_origpkgname="${pkgname%-git}"
pkgver=0.5.0.r190.630c08d
pkgrel=1
pkgdesc="colord interface, KCM and session daemon provider for KDE 5"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/graphics/colord-kde'
license=('GPL')
makedepends=('git' 'extra-cmake-modules')
depends=('colord' 'kcmutils' 'kio' 'libxrandr' 'desktop-file-utils')
optdepends=('gnome-color-manager: manual calibration')
provides=("$_origpkgname")
conflicts=("$_origpkgname")
install="$pkgname.install"
source=("${pkgname%-git}::git+git://anongit.kde.org/$_origpkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_origpkgname"
  printf "%s.r%s.%s" "$(grep COLORD_KDE_VERSION CMakeLists.txt | cut -d\" -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_origpkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

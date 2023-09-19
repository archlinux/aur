
# Maintainer: Malte Veerman <malte.veerman@gmail.com>

_srcname=fancontrol-gui
pkgname=fancontrol-plasmoid-git
pkgver=0.8.r23.g5bfa8fa
pkgrel=1
pkgdesc="Plasmoid for the fancontrol script and systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('fancontrol-gui-git' 'plasma-framework' 'gettext')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('fancontrol-plasmoid')
conflicts=('fancontrol-plasmoid')
source=('git+https://github.com/Maldela/fancontrol-gui.git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_srcname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir/$_srcname/build"
}


build() {
  msg "Starting build..."

  cd "$srcdir/$_srcname"

  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_TESTING=off \
        -DSTANDARD_CONFIG_FILE=/etc/fancontrol \
        -DSTANDARD_SERVICE_NAME=fancontrol \
        -DBUILD_GUI=off \
        -DBUILD_KCM=off \
        -DBUILD_HELPER=off \
        -DINSTALL_SHARED=off \
        -DBUILD_PLASMOID=on \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=on
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}

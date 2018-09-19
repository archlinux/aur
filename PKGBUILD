
# Maintainer: Malte Veerman <malte.veerman@gmail.com>

_srcname=fancontrol-gui
pkgname=${_srcname}-git
pkgver=v0.5.r48.g25c1a50
pkgrel=1
pkgdesc="GUI for the fancontrol script and systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-quickcontrols' 'qt5-declarative' 'lm_sensors' 'kirigami2' 'kdeclarative' 'kauth' 'kpackage' 'ki18n' 'kconfig' 'systemd')
makedepends=('git' 'extra-cmake-modules' )
provides=('fancontrol-gui')
conflicts=('fancontrol-gui' 'fancontrol-common')
source=('git://github.com/Maldela/fancontrol-gui.git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
        -DBUILD_GUI=on \
        -DBUILD_KCM=off \
        -DBUILD_HELPER=on \
        -DINSTALL_SHARED=on \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=on
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}

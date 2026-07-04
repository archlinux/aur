# Maintainer: FosRex <FosRex@aur.archlinux.org>
# Contributor: Malte Veerman <malte.veerman@gmail.com>

_srcname=fancontrol-gui
pkgname=${_srcname}-git
pkgver=0.8.r26.gc752e3b
pkgrel=1
pkgdesc="GUI for the fancontrol script and systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL-2.0-or-later')
depends=(
  'kauth5'
  'kconfig5'
  'kcoreaddons5'
  'kdbusaddons5'
  'kdeclarative5'
  'ki18n5'
  'kirigami2'
  'knotifications5'
  'kpackage5'
  'lm_sensors'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols2'
  'systemd'
)
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('fancontrol-gui' 'libfancontrol_qml_plugin.so')
conflicts=('fancontrol-gui' 'fancontrol-common' 'libfancontrol_qml_plugin.so')
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

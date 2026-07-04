# Maintainer: FosRex <FosRex@aur.archlinux.org>
# Contributor: Malte Veerman <malte.veerman@gmail.com>

_srcname=fancontrol-gui
pkgname=${_srcname}-git
pkgver=0.8.r26.gc752e3b
pkgrel=1
pkgdesc="GUI for the fancontrol script and systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/${_srcname}"
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
provides=("${_srcname}")
conflicts=("${_srcname}")
source=("git+https://github.com/Maldela/${_srcname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_srcname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg "Starting build..."

  cmake -B build -S "$srcdir/$_srcname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=off \
    -DSTANDARD_CONFIG_FILE=/etc/fancontrol \
    -DSTANDARD_SERVICE_NAME=fancontrol \
    -DBUILD_GUI=on \
    -DBUILD_KCM=off \
    -DBUILD_HELPER=on \
    -DINSTALL_SHARED=on \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=on

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

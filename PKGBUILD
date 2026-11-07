# Maintainer: Ante Laurijssen <va2bbw@gmail.com>

_pkgname=wallpaperswitch
pkgname=plasma6-${_pkgname}-git
pkgver=6.2.0.r48.gade0c55
pkgrel=1
pkgdesc='Per-virtual-desktop wallpaper switcher for KDE Plasma 6, with video wallpaper support'
arch=('x86_64')
url='https://github.com/martenjj/wallpaperswitch'
license=('GPL-2.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'kconfig'
  'kconfigwidgets'
  'kcoreaddons'
  'kcrash'
  'kdbusaddons'
  'ki18n'
  'kiconthemes'
  'kio'
  'kstatusnotifieritem'
  'kwidgetsaddons'
  'kxmlgui'
  'plasma-workspace'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)
optdepends=(
  'ffmpegthumbs: video thumbnails in the configuration dialogue'
  'plasma6-wallpapers-smart-video-wallpaper-reborn: alternative video plugin (useMediaPlugin=false)'
)
provides=("plasma6-${_pkgname}=${pkgver%%.r*}"
          "${_pkgname}=${pkgver%%.r*}")
conflicts=("plasma6-${_pkgname}"
           "${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=kf6")

pkgver() {
  cd "${_pkgname}"
  local _ver
  _ver=$(sed -n 's/^set(VERSION "\${Q}\.\(.*\)")/6.\1/p' CMakeLists.txt)
  printf '%s.r%s.g%s' "${_ver:-6.0.0}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
sha256sums=('SKIP')

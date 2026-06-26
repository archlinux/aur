# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=latte-dock-ng-git
_gitname=latte-dock-ng
pkgver=1.2.13.r0.g631a56b
pkgrel=1
pkgdesc='Latte is a dock based on plasma frameworks that provides an elegant and intuitive experience for your tasks and plasmoids'
arch=('x86_64')
url='https://github.com/ruizhi-lab/latte-dock-ng'
license=('GPL')
depends=(
  'karchive'
  'kconfig'
  'kcoreaddons'
  'kcrash'
  'kdbusaddons'
  'kdeclarative'
  'kglobalaccel'
  'kguiaddons'
  'kiconthemes'
  'ki18n'
  'kio'
  'kitemmodels'
  'knewstuff'
  'knotifications'
  'kpackage'
  'ksvg'
  'kwayland'
  'kwindowsystem'
  'kxmlgui'
  'layer-shell-qt'
  'libplasma'
  'plasma-activities'
  'plasma-activities-stats'
  'plasma-wayland-protocols'
  'plasma-workspace'
  'qt6-base'
  'qt6-declarative'
  'qt6-wayland'
  'wayland'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'gcc'
  'gettext'
  'git'
  'pkgconf'
  'python'
)
conflicts=('latte-dock')
provides=('latte-dock')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname} || exit
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cmake -S "${_gitname}" -B "${_gitname}/build" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_MAKE_UNIQUE=OFF \
    -DLATTE_INSTALL_USER_KICKERACTION_EXECUTABLE=OFF \
    -DKDE_L10N_AUTO_TRANSLATIONS=OFF

  cmake --build "${_gitname}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${_gitname}/build" --prefix /usr

  local share_dir="${pkgdir}/usr/share"
  install -d \
    "${share_dir}/plasma/plasmoids/org.kde.latte.containment" \
    "${share_dir}/plasma/plasmoids/org.kde.latte.plasmoid" \
    "${share_dir}/plasma/plasmoids/org.kde.latte.separator" \
    "${share_dir}/plasma/shells/org.kde.latte.shell" \
    "${share_dir}/latte/indicators"

  cp -a "${_gitname}/containment/package/." \
    "${share_dir}/plasma/plasmoids/org.kde.latte.containment/"
  cp -a "${_gitname}/plasmoid/package/." \
    "${share_dir}/plasma/plasmoids/org.kde.latte.plasmoid/"
  cp -a "${_gitname}/separator/package/." \
    "${share_dir}/plasma/plasmoids/org.kde.latte.separator/"
  cp -a "${_gitname}/shell/package/." \
    "${share_dir}/plasma/shells/org.kde.latte.shell/"
  cp -a "${_gitname}/indicators/." \
    "${share_dir}/latte/indicators/"
}

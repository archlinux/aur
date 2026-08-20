# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=latte-dock-ng
pkgver=1.2.39
pkgrel=1
pkgdesc='Latte is a dock based on plasma frameworks that provides an elegant and intuitive experience for your tasks and plasmoids'
arch=('x86_64')
url='https://github.com/ruizhi-lab/latte-dock-ng'
license=('GPL-2.0-or-later')
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
  'git'
  'python'
)
conflicts=('latte-dock')
provides=('latte-dock')
source=("$pkgname-$pkgver.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7e4fb2eaeb9743454c469cdfb7a41f1437a3880263ce59c5c99e076982ed9a1d')

build() {
  cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/${pkgname}-${pkgver}/build" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_MAKE_UNIQUE=OFF \
    -DLATTE_INSTALL_USER_KICKERACTION_EXECUTABLE=OFF \
    -DKDE_L10N_AUTO_TRANSLATIONS=OFF

  cmake --build "${srcdir}/${pkgname}-${pkgver}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/${pkgname}-${pkgver}/build" --prefix /usr

  local share_dir="${pkgdir}/usr/share"
  mkdir -p \
    "${share_dir}/plasma/plasmoids/org.kde.latte.containment" \
    "${share_dir}/plasma/plasmoids/org.kde.latte.plasmoid" \
    "${share_dir}/plasma/plasmoids/org.kde.latte.separator" \
    "${share_dir}/plasma/shells/org.kde.latte.shell" \
    "${share_dir}/latte/indicators"

  cp -a "${srcdir}/${pkgname}-${pkgver}/containment/package/." \
    "${share_dir}/plasma/plasmoids/org.kde.latte.containment/"
  cp -a "${srcdir}/${pkgname}-${pkgver}/plasmoid/package/." \
    "${share_dir}/plasma/plasmoids/org.kde.latte.plasmoid/"
  cp -a "${srcdir}/${pkgname}-${pkgver}/separator/package/." \
    "${share_dir}/plasma/plasmoids/org.kde.latte.separator/"
  cp -a "${srcdir}/${pkgname}-${pkgver}/shell/package/." \
    "${share_dir}/plasma/shells/org.kde.latte.shell/"
  cp -a "${srcdir}/${pkgname}-${pkgver}/indicators/." \
    "${share_dir}/latte/indicators/"
}

# Merged with official ABS gwenview PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=gwenview-git
pkgver=24.04.70_r7415.g194ac16b
pkgrel=2
pkgdesc='A fast and easy to use image viewer'
url='https://apps.kde.org/gwenview/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(baloo-git cfitsio exiv2 gcc-libs glibc kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kfilemetadata-git kguiaddons-git ki18n-git kiconthemes-git kio-git kitemmodels-git kitemviews-git kjobwidgets-git kparts-git kservice-git kwidgetsaddons-git kxmlgui-git lcms2 libjpeg-turbo libkdcraw-git libpng libtiff libx11 phonon-qt6-git plasma-activities-git purpose-git qt6-base qt6-svg qt6-wayland solid-git wayland)
makedepends=(git extra-cmake-modules-git kdoctools-git wayland-protocols)
optdepends=('kamera-git: import pictures from gphoto2 cameras'
            'kimageformats-git: support for dds, xcf, exr, psd, and more image formats'
            'qt6-imageformats: support for tiff, webp, and more image formats')
arch=($CARCH)
groups=(kde-applications-git kde-graphics-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DGWENVIEW_SEMANTICINFO_BACKEND="Baloo" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

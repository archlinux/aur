# Merged with official ABS gwenview PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=gwenview-git
pkgver=23.07.70_r7068.g23987b45
pkgrel=1
pkgdesc='A fast and easy to use image viewer'
url='https://apps.kde.org/gwenview/'
arch=($CARCH)
license=(GPL LGPL FDL)
groups=(kde-applications-git kde-graphics-git)
depends=(kactivities-git baloo-git libkdcraw-git kparts-git kitemmodels-git cfitsio phonon-qt5-git purpose-git perl kimageannotator)
optdepends=('qt5-imageformats: support for tiff, webp, and more image formats'
            'kimageformats-git: support for dds, xcf, exr, psd, and more image formats'
            'kamera-git: import pictures from gphoto2 cameras')
makedepends=(git extra-cmake-modules-git kdoctools-git)
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
    -DGWENVIEW_SEMANTICINFO_BACKEND="Baloo" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

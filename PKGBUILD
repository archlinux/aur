# Merged with official ABS kio-extras PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-extras-git
pkgver=24.04.70_r7998.g3921f08a5
pkgrel=1
pkgdesc="Additional components to increase the functionality of KIO"
arch=($CARCH)
url='https://www.kde.org/applications/internet/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kcmutils-git kconfig-git kcoreaddons-git kdbusaddons-git kdnssd-git kdsoap-qt6-git kdsoap-ws-discovery-client ki18n-git kio-git kservice-git ktextwidgets-git kwidgetsaddons-git libimobiledevice libkexiv2-git libmtp libplist libssh libxcursor phonon-qt6-git plasma-activities-git qt6-5compat qt6-base qt6-svg smbclient solid-git syntax-highlighting-git)
makedepends=(git extra-cmake-modules-git gperf kdoctools-git libappimage openexr plasma-activities-stats-git qcoro-qt6 taglib)
optdepends=('icoutils: Windows executable thumbnails'
            'kimageformats-git: thumbnails for additional image formats'
            'libappimage: AppImage thumbnails'
            'openexr: EXR format thumbnails'
            'perl: info kioslave'
            'plasma-activities-stats-git: recently used kioslave'
            'qt6-imageformats: thumbnails for additional image formats'
            'taglib: audio file thumbnails')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-network-git)
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
    -DLIBAPPIMAGE_LIBRARIES=libappimage.so \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Merged with official ABS kio-extras PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-extras-git
pkgver=21.07.70_r7026.g112b67ae
pkgrel=1
pkgdesc="Additional components to increase the functionality of KIO"
arch=($CARCH)
url='https://www.kde.org/applications/internet/'
license=(LGPL)
depends=(kio-git kdnssd-git libssh smbclient libmtp phonon-qt5-git syntax-highlighting-git kdsoap-ws-discovery-client-git libxcursor)
makedepends=(git extra-cmake-modules-git kdoctools-git gperf taglib libappimage openexr kactivities-stats-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('qt5-imageformats: thumbnails for additional image formats' 'perl: info kioslave'
            'kimageformats-git: thumbnails for additional image formats' 'taglib: audio file thumbnails'
            'libappimage: AppImage thumbnails' 'icoutils: Windows executable thumbnails'
            'openexr: EXR format thumbnails' 'kactivities-stats-git: recently used kioslave')
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
    -DLIBAPPIMAGE_LIBRARIES=libappimage.so \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

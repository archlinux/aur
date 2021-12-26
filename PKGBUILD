# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=mediaelch-git
pkgver=2.8.12.r81.g1b44628f
pkgrel=1
pkgdesc='MediaElch is a MediaManager for Kodi'
url='https://www.mediaelch.de/mediaelch/'
arch=('x86_64')
license=('LGPL3')
depends=('glibc' 'gcc-libs' 'libmediainfo' 'qt5-declarative' 'qt5-multimedia'
         'qt5-script' 'qt5-svg' 'quazip')
makedepends=('cmake' 'ninja' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Komet/MediaElch.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  sed 's|quazip5/|QuaZip-Qt5-1.1/quazip/|g' -i src/*/*.cpp src/*/*.h
  sed 's|quazip5|quazip1-qt5|g' -i */CMakeLists.txt */*/CMakeLists.txt MediaElch.pro
}

build() {
  cd "${srcdir}/${pkgname%-git}"
 cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DDISABLE_UPDATER=ON \
    -DUSE_EXTERN_QUAZIP=ON \
    -Wno-dev \
    -G Ninja
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
}


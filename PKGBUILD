# Maintainer: Christian Schendel (doppelhelix@gmail.com)
pkgname=mediaelch-git
pkgver=2.10.0.r59.g39c83fa0
pkgrel=1
pkgdesc='MediaElch is a MediaManager for Kodi'
url='https://github.com/Komet/MediaElch'
arch=('x86_64')
license=('LGPL3')

depends=('glibc'
         'gcc-libs'
         'libmediainfo'
         'qt6-declarative'
         'qt6-multimedia'
         'qt6-svg'
         'quazip-qt6')
makedepends=('cmake'
             'ninja'
             'qt6-tools')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

#prepare() {
#  cd "${srcdir}/${pkgname%-git}"
#No submodule-trickery. Use QuaZip (quazip-1-2) from system
#  sed 's|quazip5/|QuaZip-Qt5-1.2/quazip/|g' -i src/*/*.cpp src/*/*.h
#  sed 's|quazip5|quazip1-qt5|g' -i */CMakeLists.txt */*/CMakeLists.txt MediaElch.pro
#}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DDISABLE_UPDATER=ON \
        -DUSE_EXTERN_QUAZIP=ON \
        -DMEDIAELCH_FORCE_QT5=OFF \
        -DMEDIAELCH_FORCE_QT6=ON \
        -Wno-dev \
        -G Ninja
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
}

# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.2.8
pkgrel=3
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gst-plugins-good' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm' 'wxwidgets-gtk3')
makedepends=('cmake' 'boost' 'lsb-release')
optdepends=('python-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ebruck/radiotray-ng/archive/v${pkgver}.tar.gz"
        "${pkgname}"_gcc13_compilation_fix.patch::https://github.com/ebruck/radiotray-ng/commit/7a99bfa784f77be8f160961d25ab63dc2d5ccde0.patch)
sha256sums=('5bc256c21c88d055d42ed44915e3d16642004327bf45597b9c7278c88b28a5cb'
            '63d974314df9dfe6cb6a12d0468fbc02001d1d0420bdf1f75bef6e1b33702d13')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's:-Werror::' CMakeLists.txt
  patch -Np1 -i ../"${pkgname}"_gcc13_compilation_fix.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}

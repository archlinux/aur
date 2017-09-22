# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.1.7
pkgrel=2
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gstreamer' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm')
makedepends=('cmake' 'boost' 'lsb-release')
optdepends=('python2-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
source=("${pkgname}.tar.gz::https://github.com/ebruck/radiotray-ng/archive/v${pkgver}.tar.gz"
        'remove_GMock_check.patch')
sha256sums=('d7fe4c9a61455b5feea05766f79ead37a6ba70e77b15908303708c4a6c37b844'
            '0859f5e90a03b3fd5a72f763c08900b45593f6ea0bd4b2aee4baec054d64c5a5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Build fails when GMock is found, so don't check for it, don't compile tests
  patch -uNp2 -r- -i ../remove_GMock_check.patch
  # Fix for boost >= 1.65
  sed -i 's:find_package(Boost     REQUIRED filesystem system log:& thread:' CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}

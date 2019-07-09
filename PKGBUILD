# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.2.6
pkgrel=1
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gst-plugins-good' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm' 'wxgtk3')
makedepends=('cmake' 'boost' 'lsb-release')
optdepends=('python-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ebruck/radiotray-ng/archive/v${pkgver}.tar.gz"
       'rt2rtng_python3.patch')
sha256sums=('05e1b9ac7342b276fff6395a38719264f9bc47b28aadd4938c5bbe3303c67553'
            '1965811963d5e02f08231f1c53a8a6db0bf146d8e745e8b7c76f3521f82142a3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#  sed -i 's:-Werror::' CMakeLists.txt
  patch -Np1 -i ../rt2rtng_python3.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
    -DBUILD_TESTS=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}

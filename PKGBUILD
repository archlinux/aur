# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.2.10
pkgrel=1
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
        'fix_build_boost_1.89.patch::https://github.com/ebruck/radiotray-ng/commit/3de78dccf1bea2c863ef0767440dbc105ea123cd.patch')
sha256sums=('7144243735213f5167e47ed09f898771f406aa380087254ba46eebd4a9895333'
            'e2472dc9aacc542b39b5652bdb7834f9ae3e73541842d6ac44306dff5189ec80')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's:-Werror::' CMakeLists.txt
  
  patch -Np1 -i ../fix_build_boost_1.89.patch
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
  
  # Don't install the autostart file
  rm -fr "${pkgdir}"/etc/xdg/autostart/radiotray-ng.desktop
}

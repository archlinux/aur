# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.2.9
pkgrel=2
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
        'fix_gcc15_compilation.patch::https://github.com/ebruck/radiotray-ng/commit/8eb8da34bb0258d51809e2bf267ec14526694659.patch')
sha256sums=('94746f1111c7cd162cf8cbccf7dadeab3dadbb125227cb6ce8ef0b284a35f343'
            '8816714403332c791964082342c1b02c12fd676ba1853d5226e838a019d6e706')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's:-Werror::' CMakeLists.txt

  patch -Np1 -i ../fix_gcc15_compilation.patch
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

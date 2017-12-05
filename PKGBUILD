# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=radiotray-ng
pkgver=0.1.8
pkgrel=1
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
        'no_fail_on_warning.patch')
sha256sums=('4b8496256d28c7754b46cee28481bf857bb17df3fc781e014f056b2282f76fc6'
            'cedd72d28535e202ca8658d6fbe96d7c1e18a079ecf8810bf79c8a7c09716baf')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Build fails when GMock is found, so don't check for it, don't compile tests
  sed -i 's:if (GMOCK_FOUND):if (GMOCK_FOUND AND ENABLE_GMOCK):' CMakeLists.txt
  patch -uNp2 -r- -i ../no_fail_on_warning.patch
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

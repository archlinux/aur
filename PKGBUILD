# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
_pkgver=1.7.0-stable2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="https://sayonara-player.com/"
license=(GPL3)
depends=(qt5-base taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake qt5-tools qt5-svg gst-plugins-bad)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("https://sayonara-player.com/files/source/${_pkgver}/sayonara-player-${_pkgver}.tar.gz"
        "sayonara-stationAt.patch::https://gitlab.com/luciocarreras/sayonara-player/-/commit/9b29ccb521260b744f1a1dd4e9f060b6f8ac0f00.patch")
sha512sums=('ed228a318e7ec3b92e60a3b40bb1fa467ac0c1f4b705142f8f7f63c2c0ef67a5445a52ad3782962d08f7303940b4177f90ea48d908fc40c6a46f8504f3723061'
            '86a29cbb01551d3c68b455085610311171f8332dc8911bceeeef30bc26501a2abae7b260747fea4862ca09606d30353a4e1a44f3991cf993f34acc4971253b33')

prepare() {
 cd "${srcdir}/${pkgname}-${_pkgver}"
  [[ -d build ]] || mkdir build
  patch -Np1 -i ../sayonara-stationAt.patch
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_TESTS=1
  make
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make test
}
 
package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

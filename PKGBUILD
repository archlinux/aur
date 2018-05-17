# Maintainer: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>
# Contributor: Lukas Werling <lukas.werling@gmail.com>

pkgname=openclonk
pkgver=8.1
pkgrel=3
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('glew' 'freealut' 'libvorbis' 'qt5-base' 'sdl2' 'miniupnpc' 'hicolor-icon-theme')
makedepends=('cmake' 'mesa')
optdepends=('openclonk-music: proprietary music package')
conflicts=('clonk_rage')
source=("https://github.com/openclonk/openclonk/archive/v$pkgver.tar.gz"
        'directories.patch')
sha256sums=('fea0cd473334c9adf74a8930c42c78b8c2eb9255e267976a700910e07d2a0506'
            'b3104190549b35206158b58c61b80b26f300efd9dd30f507361234d7d70fd10a')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../directories.patch
}

build() {
  cd ${pkgname}-${pkgver}

  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2 \
    -DAudio_FIND_REQUIRED=On \
    -DAudio_TK=OpenAL

  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  
  make DESTDIR="$pkgdir/" install

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}


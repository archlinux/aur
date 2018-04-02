# Maintainer: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>
# Contributor: Lukas Werling <lukas.werling@gmail.com>

pkgname=openclonk
pkgver=8.1
pkgrel=2
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('glew' 'freealut' 'libvorbis' 'qt5-base' 'sdl2' 'miniupnpc' 'hicolor-icon-theme')
makedepends=('cmake' 'mesa')
optdepends=('openclonk-music: proprietary music package')
conflicts=('clonk_rage')
source=("https://git.openclonk.org/openclonk.git/archive/$pkgname-release-$pkgver-src.tar.bz2"
        'directories.patch')
sha256sums=('337677f25457e7137eac7818adb4ad02992d562593386c19b885738aaec4b346'
            'b3104190549b35206158b58c61b80b26f300efd9dd30f507361234d7d70fd10a')

prepare() {
  cd ${pkgname}-release-${pkgver}-src
  patch -p1 -i ../directories.patch
}

build() {
  cd ${pkgname}-release-${pkgver}-src

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
  cd ${pkgname}-release-${pkgver}-src/build
  
  make DESTDIR="$pkgdir/" install

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}


# Maintainer: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>
# Contributor: Lukas Werling <lukas.werling@gmail.com>

pkgname=openclonk
pkgver=8.0
pkgrel=1
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('zlib' 'libpng' 'libgl' 'libjpeg-turbo' 'freetype2' 'glew' 'freealut' 'libogg' 'libvorbis' 'gtk3>=3.4' 'libupnp' 'libxrandr' 'sdl>=1.2' 'sdl_mixer>=1.2' 'hicolor-icon-theme' 'desktop-file-utils')
install=openclonk.install
makedepends=('cmake' 'boost' 'mesa')
optdepends=('openclonk-music: proprietary music package')
conflicts=('clonk_rage')
source=("https://git.openclonk.org/openclonk.git/archive/$pkgname-release-$pkgver-src.tar.bz2"
        'directories.patch')
sha256sums=('6fc88e8c9bb0ca7eb3e3c8f60af80f77bd6d8f23632bb03f4f5e6ac4e97ae354'
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
    -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2

  make
}

package() {
  cd ${pkgname}-release-${pkgver}-src/build
  
  make DESTDIR="$pkgdir" install

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}


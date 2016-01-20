# Maintainer: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>
# Contributor: Lukas Werling <lukas.werling@gmail.com>

pkgname=openclonk
pkgver=7.0
pkgrel=4
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('zlib' 'libpng' 'libgl' 'libjpeg-turbo' 'freetype2' 'glew' 'freealut' 'libogg' 'libvorbis' 'gtk3>=3.4' 'libupnp' 'libxrandr' 'sdl>=1.2' 'sdl_mixer>=1.2' 'hicolor-icon-theme' 'desktop-file-utils')
install=openclonk.install
makedepends=('cmake' 'boost' 'mesa')
optdepends=('openclonk-music: proprietary music package')
conflicts=('clonk_rage')
source=("http://openclonk.org/builds/release/$pkgver/$pkgname-$pkgver-src.tar.bz2"
        'directories.patch')
sha256sums=('bc1a231d72774a7aa8819e54e1f79be27a21b579fb057609398f2aa5700b0732'
            '1dca1c23c342fa6b41ba72065217e31f5f5604a1500e16de54f26e9ce760f869')

prepare() {
  cd ${pkgname}-${pkgver}-src
  patch -p1 -i ../directories.patch
}

build() {
  cd ${pkgname}-${pkgver}-src

  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2

  make
}

package() {
  cd ${pkgname}-${pkgver}-src/build
  
  make DESTDIR="$pkgdir" install

  # replace the music packet with unpacked music to allow adding music
  rm "$pkgdir/usr/share/openclonk/Music.ocg"
  install -Dm644 ../planet/Music.ocg/* -t "$pkgdir/usr/share/openclonk/Music.ocg"

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}


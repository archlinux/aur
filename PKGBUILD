# Maintainer: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>
# Contributor: Lukas Werling <lukas.werling@gmail.com>

pkgname=openclonk
pkgver=7.0
pkgrel=3
_orig=$pkgname-$pkgver-src
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('gtk2' 'glew' 'sdl_mixer' 'libxpm'  'hicolor-icon-theme' 'libupnp')
makedepends=('cmake' 'boost' 'imagemagick' 'mesa')
optdepends=('openclonk-music: proprietary music package')
conflicts=('clonk_rage')
install=$pkgname.install
source=("http://openclonk.org/builds/release/$pkgver/$pkgname-$pkgver-src.tar.bz2" 'directories.patch')
md5sums=('96303965e696ac284f054ce58ee51fa9'
         'ba6ceecd5b2d3983d94e7d3aa24df5fd')

prepare() {
  cd "${srcdir}/${_orig}"
  patch -p1 -i ../directories.patch
}

build() {
  cd "${srcdir}/${_orig}"
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2
  make
}

package() {
  cd "${srcdir}/${_orig}"
  cd build
  
  make DESTDIR="$pkgdir" install

  # Replace the music packet with unpacked music to allow adding music.
  rm "$pkgdir/usr/share/openclonk/Music.ocg"
  install -Dm644 ../planet/Music.ocg/* -t "$pkgdir/usr/share/openclonk/Music.ocg"

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: ts=2 sw=2 et:

# Maintainer: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>

pkgname=openclonk
pkgver=6.1
pkgrel=1
_orig=$pkgname-$pkgver-src
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('gtk2' 'glew' 'sdl_mixer' 'libxpm'  'hicolor-icon-theme' 'libupnp')
makedepends=('cmake' 'boost' 'imagemagick' 'mesa')
conflicts=('clonk_rage')
install=$pkgname.install
source=("http://openclonk.org/builds/release/$pkgver/$pkgname-$pkgver-src.tar.bz2" 'directories.patch')
md5sums=('4d2b93bc4e0e5e97ee35b890838316b8'
         '55e35baf307d699a704e9d939d8402fb')

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

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: ts=2 sw=2 et:

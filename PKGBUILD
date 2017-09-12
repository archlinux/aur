pkgname=mingw-w64-gdk-pixbuf2
pkgver=2.36.10
pkgrel=1
pkgdesc='An image loading library (mingw-w64)'
arch=(any)
url='http://www.gtk.org'
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure')
depends=(
  'mingw-w64-crt'
  'mingw-w64-glib2>=2.37.6'
  'mingw-w64-jasper'
  'mingw-w64-libpng'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libtiff')
options=(!strip !buildflags staticlibs)
source=(
  "https://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-$pkgver.tar.xz")
sha256sums=('f8f6fa896b89475c73b6e9e8d2a2b062fc359c4b4ccb8e96470d6ab5da949ace')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --enable-relocations \
      --with-included-loaders \
      --with-libjasper
    # We don't build dynamic modules, so we can use an empty file here.
    touch gdk-pixbuf/loaders.cache
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtL1 ${_arch}-strip
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtL1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtL1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share/man"
    cd ..
  done
}

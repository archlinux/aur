pkgname=mingw-w64-gdk-pixbuf2
pkgver=2.31.7
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
  "https://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-$pkgver.tar.xz"
  'gdk-pixbuf2-bug-754154-fix-non-glibc-build.patch')
sha256sums=('4736e009168857ce8bb19291f0887c1dc6551cbc3c46d5ffcd034e133e4fd610'
            'a8b752b97c40f47473f1aa2b17063aded232c1921bbe797c8d44a6d644cdaa16')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  patch -p1 < "${srcdir}/${source[1]}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure --with-included-loaders --with-libjasper
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share/man"
    cd ..
  done
}

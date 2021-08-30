pkgname=mingw-w64-json-glib
pkgver=1.0.4
pkgrel=1
pkgdesc="JSON library built on GLib (mingw-w64)"
arch=('any')
url="http://live.gnome.org/JsonGlib"
license=("GPL")
makedepends=('mingw-w64-configure' 'python')
depends=('mingw-w64-glib2>=2.38')
options=(!strip !buildflags staticlibs)
source=("http://ftp.gnome.org/pub/gnome/sources/json-glib/${pkgver%.*}/json-glib-${pkgver}.tar.xz")
sha256sums=('80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442b3e62bd6de05cd')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/json-glib-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure --disable-glibtest
    make
    cd ..
  done
}


package() {
  cd "${srcdir}/json-glib-${pkgver}"

  for _arch in $_architectures; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install

    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g

    cd ..
  done
}

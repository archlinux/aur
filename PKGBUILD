pkgname=mingw-w64-json-glib
pkgver=1.6.6
pkgrel=1
pkgdesc="JSON library built on GLib (mingw-w64)"
arch=('any')
url="http://live.gnome.org/JsonGlib"
license=("GPL")
makedepends=('mingw-w64-meson' 'ninja')
depends=('mingw-w64-glib2>=2.38')
options=(!strip !buildflags staticlibs)
source=("http://ftp.gnome.org/pub/gnome/sources/json-glib/${pkgver%.*}/json-glib-${pkgver}.tar.xz")
sha256sums=('96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/json-glib-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-meson .. --buildtype plain -Ddocs=true -Dman=true
	ninja
    cd ..
	
  done
}


package() {
  cd "${srcdir}/json-glib-${pkgver}"

  for _arch in $_architectures; do
    cd "build-${_arch}"
    DESTDIR="${pkgdir}" ninja install

    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g

    cd ..
  done
}

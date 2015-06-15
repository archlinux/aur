# Maintainer: ant32 <antreimer@gmail.com>
pkgname=mingw-w64-poppler
pkgver=0.33.0
pkgrel=1
pkgdesc="PDF rendering library based on xpdf 3.0 (mingw-w64)"
arch=(any)
url="http://poppler.freedesktop.org"
license=("GPL")
makedepends=('mingw-w64-configure'
             'mingw-w64-glib2'
             'mingw-w64-qt5-base'
             'mingw-w64-qt4')
depends=('mingw-w64-crt'
         'mingw-w64-libtiff'
         'mingw-w64-openjpeg'
         'mingw-w64-cairo'
         'mingw-w64-curl')
optdepends=("mingw-w64-glib2: libpoppler-glib"
            "mingw-w64-qt5-base: libpoppler-qt5"
            "mingw-w64-qt4: libpoppler-qt4")
options=('!strip' '!buildflags' 'staticlibs')
source=("http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz")
md5sums=('69927d1614d6704021c0b0dd0ee6a852')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/poppler-$pkgver"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p "${_arch%%-*}" && pushd "${_arch%%-*}"
    ${_arch}-configure \
      --enable-cairo-output \
      --enable-poppler-qt4 \
      --enable-poppler-qt5 \
      --enable-xpdf-headers \
      --enable-poppler-glib \
      --enable-libjpeg \
      --enable-libopenjpeg=openjpeg1 \
      --disable-zlib \
      --enable-libcurl \
      --disable-gtk-test \
      --disable-utils \
      --disable-gtk-doc-html \
      --with-font-configuration=win32
    make V=1
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/poppler-$pkgver/${_arch%%-*}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
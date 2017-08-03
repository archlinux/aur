# Maintainer: ant32 <antreimer@gmail.com>
pkgname=mingw-w64-poppler
pkgver=0.57.0
pkgrel=1
pkgdesc="PDF rendering library based on xpdf 3.0 (mingw-w64)"
arch=(any)
url="http://poppler.freedesktop.org"
license=("GPL")
makedepends=(mingw-w64-configure mingw-w64-glib2 mingw-w64-qt5-base mingw-w64-qt4 mingw-w64-icu mingw-w64-curl)
depends=(mingw-w64-openjpeg2 mingw-w64-cairo)
optdepends=("mingw-w64-glib2: libpoppler-glib"
"mingw-w64-qt5-base: libpoppler-qt5"
"mingw-w64-qt4: libpoppler-qt4")
options=(!strip !buildflags staticlibs)
source=("http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz")
sha256sums=('0ea37de71b7db78212ebc79df59f99b66409a29c2eac4d882dae9f2397fe44d8')

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
      --enable-zlib \
      --enable-libopenjpeg=openjpeg2 \
      --enable-libcurl \
      --disable-gtk-test \
      --disable-gtk-doc-html \
      --with-font-configuration=win32
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/poppler-$pkgver/${_arch%%-*}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

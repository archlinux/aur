# Maintainer: ant32 <antreimer@gmail.com>
pkgname=mingw-w64-poppler
pkgver=0.64.0
pkgrel=1
pkgdesc="PDF rendering library based on xpdf 3.0 (mingw-w64)"
arch=(any)
url="https://poppler.freedesktop.org"
license=("GPL")
makedepends=(mingw-w64-configure mingw-w64-glib2 mingw-w64-icu mingw-w64-curl)
depends=(mingw-w64-openjpeg2 mingw-w64-cairo)
optdepends=("mingw-w64-glib2: libpoppler-glib")
options=(!strip !buildflags staticlibs)
source=("https://poppler.freedesktop.org/poppler-${pkgver}.tar.xz")
sha256sums=('b21df92ca99f78067785cf2dc8e06deb04726b62389c0ee1f5d8b103c77f64b1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/poppler-$pkgver"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p "${_arch%%-*}" && pushd "${_arch%%-*}"
    ${_arch}-cmake \
        -DBUILD_CPP_TESTS=NO \
        -DBUILD_GTK_TESTS=NO \
        -DBUILD_QT5_TESTS=NO \
        ..
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

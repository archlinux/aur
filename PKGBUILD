# Maintainer: ant32 <antreimer@gmail.com>
pkgname=mingw-w64-poppler
pkgver=0.31.0
pkgrel=2
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
source=("http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz"
        "give-cc-to-gir-scanner.mingw.patch"
        'poppler_pkgconfig_private_libs.patch')
md5sums=('b631498668562ba47732785e54808468'
         '727c1b414987f6ee2ba841d9db57a967'
         'd3a63b8eeb2a023e62b572bd836b82e6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/poppler-$pkgver"

  patch -p1 -i ../give-cc-to-gir-scanner.mingw.patch
  # Add Libs.private sections to pkg-config
  patch -p1 -i ../poppler_pkgconfig_private_libs.patch

  autoreconf -fi
}

build() {
  cd "$srcdir/poppler-$pkgver"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p "${_arch%%-*}" && pushd "${_arch%%-*}"
    ${_arch}-configure \
      --enable-cairo-output \
      --enable-poppler-qt4 \
      --enable-poppler-qt5 \
      --enable-poppler-glib \
      --enable-libjpeg \
      --enable-libopenjpeg=openjpeg1 \
      --disable-zlib \
      --enable-libcurl \
      --disable-gtk-test \
      --disable-utils \
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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
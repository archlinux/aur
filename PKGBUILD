# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=mingw-w64-cairo-bootstrap
pkgver=1.16.0
pkgrel=3
pkgdesc="Cairo vector graphics library (mingw-w64 bootstrap)"
arch=(any)
url="http://cairographics.org/"
license=("LGPL" "MPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-pixman mingw-w64-glib2 mingw-w64-fontconfig mingw-w64-libpng mingw-w64-lzo)
options=(!strip !buildflags staticlibs)
provides=(${pkgname%-bootstrap}=$pkgver)
conflicts=(${pkgname%-bootstrap})
source=("https://cairographics.org/releases/cairo-${pkgver}.tar.xz"
        "0009-standalone-headers.mingw.patch"
        "0026-create-argb-fonts.all.patch"
        "0027-win32-print-fix-unbounded-surface-assertion.patch"
        "0001-ft-Use-FT_Done_MM_Var-instead-of-free-when-available.patch")
sha256sums=('5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331'
            '234de8c5d4c28b03c19e638a353e8defb2de0367a634c002b0ea7d2877bd0756'
            '6db6c44fbdb4926d09afa978fe80430186c4b7b7d255059602b1f94c6a079975'
            '7e244c20eec8c7b287dbee1d34de178d9b0c419dc4c2b11c90eaf626c92bf781'
            '52ab418058076ad01e046ebbbdc834f390305516c222d07de91a93a4dcebe921')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd cairo-$pkgver
  patch -p1 -i ${srcdir}/0009-standalone-headers.mingw.patch
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
  patch -p1 -i ${srcdir}/0027-win32-print-fix-unbounded-surface-assertion.patch
  # CVE-2018-19876
  patch -p1 -i ${srcdir}/0001-ft-Use-FT_Done_MM_Var-instead-of-free-when-available.patch
  autoreconf -fi
}

build() {
  cd cairo-${pkgver}
  CFLAGS+=" -Wno-implicit-function-declaration"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-win32 \
      --enable-win32-font \
      --enable-gobject \
      --enable-tee \
      --disable-xlib \
      --disable-xcb \
      --disable-gtk-doc \
      --disable-gtk-doc-html \
      ac_cv_prog
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cairo-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

# vim: ts=2 sw=2 et:

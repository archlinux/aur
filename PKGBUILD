# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=mingw-w64-cairo-bootstrap
pkgver=1.17.2+17+g52a7c79fd
pkgrel=2
pkgdesc="2D graphics library with support for multiple output devices (mingw-w64 bootstrap)"
_commit=52a7c79fd4ff96bb5fac175f0199819b0f8c18fc
arch=(any)
url="http://cairographics.org/"
license=("LGPL" "MPL")
makedepends=(mingw-w64-configure git)
depends=(mingw-w64-pixman mingw-w64-glib2 mingw-w64-fontconfig mingw-w64-libpng mingw-w64-lzo)
options=(!strip !buildflags staticlibs)
provides=(${pkgname%-bootstrap}=$pkgver)
conflicts=(${pkgname%-bootstrap})
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit"
        "0009-standalone-headers.mingw.patch"
        "0026-create-argb-fonts.all.patch"
        "0027-win32-print-fix-unbounded-surface-assertion.patch"
        "0001-image-compositor-Remove-the-right-glyph-from-pixman-.patch")
sha256sums=('SKIP'
            '234de8c5d4c28b03c19e638a353e8defb2de0367a634c002b0ea7d2877bd0756'
            '6db6c44fbdb4926d09afa978fe80430186c4b7b7d255059602b1f94c6a079975'
            '7e244c20eec8c7b287dbee1d34de178d9b0c419dc4c2b11c90eaf626c92bf781'
            '262bf1cebc04eaae93dbfab56045ad800b3b027be303ca2611375645108f171f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd cairo
  patch -p1 -i ${srcdir}/0009-standalone-headers.mingw.patch
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
  patch -p1 -i ${srcdir}/0027-win32-print-fix-unbounded-surface-assertion.patch
  # https://bugs.archlinux.org/task/63856
  patch -p1 -i ${srcdir}/0001-image-compositor-Remove-the-right-glyph-from-pixman-.patch

  # Fix typo
  sed -i 's/have_png/use_png/g' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd cairo
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
    cd "${srcdir}/cairo/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:

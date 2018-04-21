# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=mingw-w64-cairo
pkgver=1.15.10
pkgrel=1
pkgdesc="Cairo vector graphics library (mingw-w64)"
arch=(any)
url="https://cairographics.org/"
license=("LGPL" "MPL")
makedepends=(mingw-w64-configure mingw-w64-librsvg mingw-w64-poppler)
depends=(mingw-w64-fontconfig mingw-w64-pixman mingw-w64-lzo mingw-w64-glib2)
options=(!strip !buildflags staticlibs)
provides=($pkgname-bootstrap)
replaces=($pkgname-bootstrap)
conflicts=($pkgname-bootstrap)
source=("https://cairographics.org/snapshots/cairo-${pkgver}.tar.xz"
"0009-standalone-headers.mingw.patch"
"0026-create-argb-fonts.all.patch"
"0027-win32-print-fix-unbounded-surface-assertion.patch")
sha1sums=('de180498ac563249b93ee5e17ba9aa26f90644b3'
          '58c548d2791ba20dd7f6e328ff596f746df3aa10'
          '9c0e533614782a41af2c3806a43ab7fe9d6a5431'
          'e601596b520f9cbb322bdc217dd78a9ecfdb1ef1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd cairo-$pkgver
  patch -p1 -i ${srcdir}/0009-standalone-headers.mingw.patch
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
  patch -p1 -i ${srcdir}/0027-win32-print-fix-unbounded-surface-assertion.patch
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
      --enable-pdf \
      --enable-ps \
      --enable-svg \
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

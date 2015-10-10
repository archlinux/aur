# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=mingw-w64-cairo
pkgver=1.14.2
pkgrel=4
pkgdesc="Cairo vector graphics library (mingw-w64)"
arch=(any)
url="http://cairographics.org/"
license=("LGPL" "MPL")
makedepends=(mingw-w64-configure mingw-w64-librsvg mingw-w64-poppler)
depends=(mingw-w64-fontconfig mingw-w64-pixman mingw-w64-lzo mingw-w64-glib2)
options=(!strip !buildflags staticlibs)
source=("http://cairographics.org/releases/cairo-${pkgver}.tar.xz"
"0009-standalone-headers.mingw.patch"
"0026-create-argb-fonts.all.patch"
"0030-add-cairo-API-to-setup-Win32-surface-for-HDC.patch"
"0031-ad-Win32-boilerplate.patch")
sha1sums=('c8da68aa66ca0855b5d0ff552766d3e8679e1d24'
          '58c548d2791ba20dd7f6e328ff596f746df3aa10'
          '9c0e533614782a41af2c3806a43ab7fe9d6a5431'
          'c0c9546f120133b8e5b116650ba233a15a1e20c4'
          'f0ce67743fe91668bbbd7bbbabdd2e74b9137026')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd cairo-$pkgver
	patch -p1 -i ${srcdir}/0009-standalone-headers.mingw.patch
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
  patch -p1 -i ${srcdir}/0030-add-cairo-API-to-setup-Win32-surface-for-HDC.patch
  patch -p1 -i ${srcdir}/0031-ad-Win32-boilerplate.patch
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
      --enable-png \
      --enable-gobject \
      --enable-tee \
      --disable-xlib \
      --disable-xcb \
      --enable-fc \
      --enable-ft \
      --disable-silent-rules \
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

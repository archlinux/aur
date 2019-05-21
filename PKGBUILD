# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: Xiao-Long Chen < chenxiaolong at cxl dot epac dot to >

_pkgname=cairo
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-cairo
pkgver=1.17.2
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices (mingw-w64)"
arch=('any')
url="https://cairographics.org"
license=('LGPL' 'MPL')
depends=('mingw-w64-fontconfig'
         'mingw-w64-pixman'
         'mingw-w64-libpng'
         'mingw-w64-lzo'
         'mingw-w64-glib2')
makedepends=('mingw-w64-configure'
             'mingw-w64-librsvg'
             'mingw-w64-poppler')
conflicts=("${pkgname}-bootstrap")
replaces=("${pkgname}-bootstrap")
options=('!strip' '!buildflags' 'staticlibs')
source=("https://cairographics.org/snapshots/${_pkgname}-${pkgver}.tar.xz"
        "0009-standalone-headers.mingw.patch"
        "0026-create-argb-fonts.all.patch"
        "0027-win32-print-fix-unbounded-surface-assertion.patch")
sha256sums=('6b70d4655e2a47a22b101c666f4b29ba746eda4aa8a0f7255b32b2e9408801df'
            '234de8c5d4c28b03c19e638a353e8defb2de0367a634c002b0ea7d2877bd0756'
            '6db6c44fbdb4926d09afa978fe80430186c4b7b7d255059602b1f94c6a079975'
            '7e244c20eec8c7b287dbee1d34de178d9b0c419dc4c2b11c90eaf626c92bf781')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/0009-standalone-headers.mingw.patch
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
  patch -p1 -i ${srcdir}/0027-win32-print-fix-unbounded-surface-assertion.patch
  autoreconf -fi
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  CFLAGS+=" -Wno-implicit-function-declaration"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
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
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "${pkgdir}/usr/${_arch}/share"
    popd
  done
}

# vim:set ts=2 sw=2 et:

# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: Xiao-Long Chen < chenxiaolong at cxl dot epac dot to >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-cairo
pkgver=1.18.2
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices (mingw-w64)"
arch=('any')
url="https://cairographics.org"
license=('LGPL-2.1-only OR MPL-1.1')
depends=('mingw-w64-fontconfig'
         'mingw-w64-pixman'
         'mingw-w64-libpng'
         'mingw-w64-lzo'
         'mingw-w64-glib2')
makedepends=('git'
             'mingw-w64-meson'
             'mingw-w64-environment'
             'mingw-w64-librsvg'
             'mingw-w64-poppler')
conflicts=("${pkgname}-bootstrap")
replaces=("${pkgname}-bootstrap")
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#tag=$pkgver"
        "0026-create-argb-fonts.all.patch")
b2sums=('ff661ec100a24a457c91b928ad537e783e59ffc56812aa1d1da09bfe425390f8e6df0191a7993aeb56e9b064403a389d252e64f557f09ea6f773f821a021c9ca'
        '62c63b4ecfec80e179bad977dcaea53e2818d2a3f58a9753f0441b9c0f776a8ef104bb188305692fd134c2c0e8559f7dc713689efb3876fec6b3115d8259b064')

pkgver() {
  cd "${srcdir}/cairo"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "${srcdir}/cairo"
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    export CFLAGS=-fpermissive
    source mingw-env ${_arch}
    ${_arch}-meson cairo build-${_arch} \
      --buildtype=release \
      --default-library=both \
      -D b_lto=false \
      -D dwrite=disabled \
      -D freetype=enabled \
      -D fontconfig=enabled \
      -D gtk_doc=false \
      -D spectre=disabled \
      -D symbol-lookup=disabled \
      -D tests=disabled \
      -D c_args="$CFLAGS"
    meson compile -C build-${_arch}
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:

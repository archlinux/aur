# -*- mode: Shell-script; eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser < git at msrd0 dot de >
# Contributor: Martchus <martchus@gmx.net>

_pkgname=mingw-w64-freetype2-static
pkgname=$_pkgname
pkgver=2.12.1
pkgrel=2
pkgdesc='Font rasterization library (mingw-w64)'
arch=('any')
url='https://www.freetype.org/'
license=('GPL')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2 mingw-w64-brotli-static)
makedepends=(mingw-w64-gcc mingw-w64-meson)
provides=("mingw-w64-freetype2=$pkgver")
conflicts=(mingw-w64-freetype2)
replaces=(mingw-w64-freetype2-bootstrap)
options=(!strip !buildflags !libtool staticlibs)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch)
sha256sums=('4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f'
            'SKIP'
            '12c869eeba212c74d07d3d7815848b047ecb5282d5463dffb3bb6d219315d4da'
            '2497dcb3650271db9bb7ad4f3379b5b3c6a19f5ca5388dd9ba7d42b5c15c8c4f'
            'caa0bc7d3dfa3b4c6b9beecda6141405dafe540f99a655dc83d1704fa232ac20'
            '8bf978cd1abd73f54c53f7d214c368b1fd8921cd9800d2cc84427c662ffbbdcb')
validpgpkeys=(E30674707856409FF1948010BE6C3AAC63AD8E3F) # Werner Lemberg <wl@gnu.org>

if [[ $pkgname = "$_pkgname-bootstrap" ]]; then
  _provides="$_pkgname"
else
  _provides="$_pkgname-bootstrap"
  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  depends+=(mingw-w64-harfbuzz)
  replaces+=(${_provides})
fi
provides+=("${_provides}=$pkgver")
conflicts+=(${_provides})

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/freetype-${pkgver}"

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/freetype-${pkgver}/build-${_arch}"
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    ${_arch}-meson --default-library static -D zlib=enabled -D bzip2=enabled -D png=disabled -D brotli=enabled
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-ranlib "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}

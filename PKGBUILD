# -*- mode: Shell-script; eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser < git at msrd0 dot de >
# Contributor: Martchus <martchus@gmx.net>

_pkgname=mingw-w64-freetype2-static
pkgname=$_pkgname
pkgver=2.13.0
pkgrel=1
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
        0004-Enable-long-PCF-family-names.patch
        0005-builds-meson-parse_modules_cfg.py-Handle-gxvalid-and.patch)
sha256sums=('5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c'
            'SKIP'
            'd279a9d4b2c146722dbc03f9a33009846efe8bbbe3ada52beb4a1aa4d4dfaa38'
            'f2e8a16126723458b413e58da267fb30332d0b42fef972f951e3e9fc081fa492'
            '8e61d12ebdbbcb764a38d4798ee728074bac0aa20978d538b6e7045a63949ab8'
            'cc364cc0ca21b8b30f29d90ab394d82f3303ca7d9813d866e6bf14f9bccd9564'
            '08cf087d7d612b4228e24d74df95cf1f397f7c41054c42837c63c1f33ffaee09')
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
  patch -Np1 -i ../0005-builds-meson-parse_modules_cfg.py-Handle-gxvalid-and.patch
}

build() {
  local harfbuzz_support=enabled
  [[ $pkgname = 'mingw-w64-freetype2-bootstrap' ]] && harfbuzz_support=disabled
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

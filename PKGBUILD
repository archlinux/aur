# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-freetype2
pkgver=2.13.3
pkgrel=1
pkgdesc='Font rasterization library (mingw-w64)'
arch=('any')
url='https://www.freetype.org/'
license=('FTL OR GPL-2.0-or-later')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2 mingw-w64-brotli)
makedepends=(mingw-w64-gcc mingw-w64-meson)
options=(!strip !buildflags !libtool staticlibs)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
)
b2sums=('f9591c6998df02b072adaf38a968e91deae8ed4d53ea0cb74d08982c4f0e48b1a98c1378a698164e4f730f07a3b0bea308a94fcc2e2b8ce9967dbf9478b599bd'
        'SKIP'
        'b7e3b72e2d6aed548c1762a16ee08ac47a05caf29c5d37ef03c6791e6dbd109fdfef0b246540c35e968d54f2103b70e80eccff72ac54d34224c6d064aa53d720'
        'd2b507830adf1bb9db619cd2e0bbb0dfe5b16ba7d4467ad503e954cf91715c5aa5b52b1d3865abc9841990cda56f223eb6f282d4baf7f31fd525cc90aa96b884'
        'b83a599da8eef1c39a268482db8e82f03a2c9b68850a0ec782e9839e7b45a3b0f989d997647eb55e5b18f2fe0c988e73f0ec6c4eb4c0787689f9e0213faa4320')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F # Werner Lemberg <wl@gnu.org>
)

if [[ $pkgname = 'mingw-w64-freetype2-bootstrap' ]]; then
  _provides=(${pkgname%-bootstrap})
else
  _provides=(${pkgname}-bootstrap)
  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  depends+=(mingw-w64-harfbuzz)
fi
provides+=(${_provides})
conflicts+=(${_provides})

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
}

build() {
  local harfbuzz_support=enabled
  [[ $pkgname = 'mingw-w64-freetype2-bootstrap' ]] && harfbuzz_support=disabled
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/freetype-${pkgver}/build-${_arch}"
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    ${_arch}-meson --default-library both -D zlib=enabled -D bzip2=enabled -D png=disabled -D harfbuzz="$harfbuzz_support" -D brotli=enabled -D b_lto=false
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-ranlib "${pkgdir}/usr/${_arch}/lib/"*.a
  done
  install -Dm644 "$srcdir/freetype-$pkgver/docs/FTL.TXT" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

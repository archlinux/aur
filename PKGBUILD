# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-freetype2-bootstrap
pkgver=2.14.1
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
b2sums=('1dc62d337a93ca94f93496e60bdf9cbabed5867d66bb2f07669f1b5f81ef16f6cc57c401f51bb62d919680316f73902fafb6a167c45183872faaf984840b5ec7'
        'SKIP'
        'f45ec7d03193b446d8b46c8d981f330843a1ab2c83a91a5011cb328b26b4fc4c4b5729f32f3270018cf5ba8a162712bd0ebc2cd67f97b906e46ce293aeda466f'
        'b9481bfe770104b181a59be8cf30c90d329447d3ba04bd7dc641a54057cf2a9024c1a881d096b7ff940e9b467960ff3e08e611686d9a01136523fbb34299d057'
        '1ced8e4ef522b111759953f6b4b38864b1a705e5b6705222282b0e6857a4ee7ac8bdcec35248f53dd8b628fabb8861ee82c4ac957f4c71229bac94d8aaf82984')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F # Werner Lemberg <wl@gnu.org>
)

if [[ $pkgname = 'mingw-w64-freetype2-bootstrap' ]]; then
  _provides=(${pkgname%-bootstrap})
else
  _provides=(${pkgname}-bootstrap)
  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  # note: The official package uses -D freetype2:harfbuzz=dynamic making this a makedepends/optdepends but not
  # sure whether this will work with Windows DLLs and for the static library this is not wanted anyway.
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
    ${_arch}-meson --default-library both \
      -D zlib=enabled \
      -D bzip2=enabled \
      -D png=disabled \
      -D harfbuzz="$harfbuzz_support" \
      -D brotli=enabled \
      -D b_lto=false \
      -D freetype2:error_strings=true
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

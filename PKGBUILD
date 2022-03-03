# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-freetype2
pkgver=2.11.1
pkgrel=1
pkgdesc='Font rasterization library (mingw-w64)'
arch=('any')
url='https://www.freetype.org/'
license=('GPL')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2 mingw-w64-brotli)
makedepends=(mingw-w64-gcc mingw-w64-meson)
provides=(mingw-w64-freetype)
replaces=(mingw-w64-freetype)
conflicts=(mingw-w64-freetype)
options=(!strip !buildflags !libtool staticlibs)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch)
sha256sums=('3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8'
            'SKIP'
            '663310ef70f7830de462fb8964ee4fa1d49ad4aeb1a6eae5857707e161039a53'
            '17cd4bd0c650b9bdd3bc30581ad6457524db14ec34b56f98e243357c3ab4bc05'
            '0607ac8176d4f08bcfb78d07bdc2c66fcbe7dfde6c82a0e98d6e625597442fd0'
            '6e5192dc08119e32992eee5a15595e131adcc9d2411066ca8691bfe2af14d97e')
validpgpkeys=(58E0C111E39F5408C5D3EC76C1A60EACE707FDA5) # Werner Lemberg <wl@gnu.org>

if [[ $pkgname = 'mingw-w64-freetype2-bootstrap' ]]; then
  _provides=${pkgname%-bootstrap}
else
  _provides=${pkgname}-bootstrap
  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  depends+=(mingw-w64-harfbuzz)
  replaces+=(${_provides})
fi
provides+=(${_provides})
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
    ${_arch}-meson --default-library both -D zlib=enabled -D bzip2=enabled -D png=disabled -D brotli=enabled
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
}

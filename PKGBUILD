# Maintainer: ashka <aur AT ashka DOT me>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-ttmetrics
_srcname=freetype
pkgver=2.11.0
pkgrel=1
pkgdesc="Font rasterization library with TrueType metrics enabled"
arch=(i686 x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
provides=("libfreetype.so" "freetype2=$pkgver")
conflicts=('freetype2')
install=freetype2.install
backup=('etc/profile.d/freetype2.sh')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        freetype2.sh
        enable_truetype_like_size_metrics.patch
        fix_metrics_on_size_request.patch)
sha1sums=('f1635a1ed68ee467be33036d8881b7b89177663f'
          '46fd67e6a594f6c2c473b9321ba64913984ba42f'
          '4bf0c0749db09878b918cc404300f0d3e9091607'
          'af76172be8135e74391b7ad1b82c2124ae0ad86c'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          'd9b223610b530de017a919ee93d506d4450b04fa'
          'fcb6e379591f06793d4e081f8a9ea7731b484478')

prepare() {
  cd ${_srcname}-${pkgver}

  # Official package patches
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch

  # ttmetrics patches
  # see https://bbs.archlinux.org/viewtopic.php?id=226380
  #
  # with thanks to the freebsd developers for the second patch,
  # see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=219608 and
  # https://bugs.freebsd.org/bugzilla/attachment.cgi?id=183997&action=diff
  patch -Np1 -i ../enable_truetype_like_size_metrics.patch
  patch -Np1 -i ../fix_metrics_on_size_request.patch
}

build() {
  cd ${_srcname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd ${_srcname}-${pkgver}
  make -k check
}

package() {
  cd ${_srcname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"
}

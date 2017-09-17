# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-ttmetrics
_srcname=freetype
pkgver=2.8.1
pkgrel=2
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
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        freetype2.sh
        enable_truetype_like_size_metrics.patch
        revert_allow_linear_scaling.patch)
sha1sums=('417bb3747c4ac95b6f2652024a53fad45581fa1c'
          'c3e91e668936206d3c158bffde0f69788a086a5b'
          '81586014ea44375ddc85dd9dbcabae6e91c34d62'
          '334f229875039794adeb574e27d365bb445fb314'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          '833a8622bc61fc6f41c0e87c3614dec73490c9b1'
          'f2cc372aedce56b387ee0c5403745d642bd44fe8')

prepare() {
  cd ${_srcname}-${pkgver}

  # Official package patches
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch

  # ttmetrics patches
  # see https://bbs.archlinux.org/viewtopic.php?id=226380
  patch -Np1 -i ../enable_truetype_like_size_metrics.patch
  patch -Np1 -i ../revert_allow_linear_scaling.patch
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

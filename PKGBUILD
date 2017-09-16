# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-ttmetrics
pkgver=2.8.1
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
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
        https://download-mirror.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        freetype2.sh
        enable_truetype_like_size_metrics.patch
        revert_allow_linear_scaling.patch)
sha1sums=('417bb3747c4ac95b6f2652024a53fad45581fa1c'
          '9ee079ee02e6b6895802104f58cd5e5be517dce7'
          'c3e91e668936206d3c158bffde0f69788a086a5b'
          '4ff958229a7f87e04a9894d5a6ed2df227071931'
          '81586014ea44375ddc85dd9dbcabae6e91c34d62'
          '334f229875039794adeb574e27d365bb445fb314'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          '833a8622bc61fc6f41c0e87c3614dec73490c9b1'
          'f2cc372aedce56b387ee0c5403745d642bd44fe8')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch

  # See https://bbs.archlinux.org/viewtopic.php?id=226380
  patch -Np1 -i ../enable_truetype_like_size_metrics.patch

  # Also see https://bbs.archlinux.org/viewtopic.php?id=226380
  patch -Np1 -i ../revert_allow_linear_scaling.patch
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype2
  make -k check
}

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -d "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/freetype2"
}

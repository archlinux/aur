# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-ttmetrics
_srcname=freetype
pkgver=2.9
pkgrel=3
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
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        0001-psaux-Correctly-handle-Flex-features-52846.patch
        freetype2.sh
        enable_truetype_like_size_metrics.patch
        fix_metrics_on_size_request.patch)
sha1sums=('94c4399b1a55c5892812e732843fcb4a7c2fe657'
          'b69531770c343d403be294b7e4d25ac45738c833'
          '3d26a569f0cb94c28a550577f5dcaadb4e193d91'
          '770f1981734a837bcf065564c91644b4cc5e256a'
          '21ad7dd31e16adb5b39adfa5671018a736626562'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          '833a8622bc61fc6f41c0e87c3614dec73490c9b1'
          'fcb6e379591f06793d4e081f8a9ea7731b484478')

prepare() {
  cd ${_srcname}-${pkgver}

  # Official package patches
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch

  # Freetype 2.9 regression: bad rendering for some Type 1 fonts
  # https://savannah.nongnu.org/bugs/?52846
  patch -Np1 -i ../0001-psaux-Correctly-handle-Flex-features-52846.patch

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

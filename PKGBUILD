# Based on freetype2 from extra
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-old-hinting
pkgname=('freetype2-old-hinting')
pkgver=2.9
pkgrel=2
pkgdesc="Font rasterization library (including the old hinting engine)"
arch=(i686 x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        0001-psaux-Correctly-handle-Flex-features-52846.patch
        freetype2.sh)
sha1sums=('94c4399b1a55c5892812e732843fcb4a7c2fe657'
          'SKIP'
          'b69531770c343d403be294b7e4d25ac45738c833'
          '3d26a569f0cb94c28a550577f5dcaadb4e193d91'
          '770f1981734a837bcf065564c91644b4cc5e256a'
          '21ad7dd31e16adb5b39adfa5671018a736626562'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch

  # Freetype 2.9 regression: bad rendering for some Type 1 fonts
  # https://savannah.nongnu.org/bugs/?52846
  patch -Np1 -i ../0001-psaux-Correctly-handle-Flex-features-52846.patch

  sed -ri 's|/\* +(#define +CFF_CONFIG_OPTION_OLD_ENGINE) +\*/|\1|' include/freetype/config/ftoption.h
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

package_freetype2-old-hinting() {
  provides=('libfreetype.so' "freetype2=$pkgver-$pkgrel")
  conflicts=('freetype2')
  install=freetype2.install
  backup=('etc/profile.d/freetype2.sh')

  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dt "${pkgdir}/etc/profile.d" -m644 ../freetype2.sh
}

# vim:set ts=2 sw=2 et:

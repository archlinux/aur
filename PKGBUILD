# Maintainer: Paul Clark <paul500clark at gmail dot com>
pkgname=perl-tk-xft
pkgver=804.036
pkgrel=3
pkgdesc="A graphical user interface toolkit for Perl with libxft support"
arch=('x86_64')
url="https://search.cpan.org/dist/Tk"
license=('PerlArtistic' 'GPL' 'custom')
depends=('libpng' 'libjpeg-turbo' 'perl' 'libxft')
checkdepends=('xorg-server-xvfb' 'perl-devel-leak' 'perl-test-pod' 'ttf-font')
provides=('perl-tk')
conflicts=('perl-tk')
source=("https://www.cpan.org/authors/id/S/SR/SREZIC/Tk-$pkgver.tar.gz"
       gcc-14.patch)
sha512sums=('7d8b82127a5fdbb2f0387f541af8844a09f1230f377b92d511ecb12e81bfd5ef56d4fe925cac064a798a96a003bb8465b6df37cff18a960f3631bb3a214cd812'
            '01d5e58314bd25cd2bd6aed990dca2c0a36c0f9a9cc069cb5842d437f6f85260cf1ef08f04c61b4ef132657f92bd5d026915cf8cceddc6e054ca20f8f8c21d48')

prepare() {
  cd Tk-$pkgver
  patch -p1 -i ../gcc-14.patch # Fix build with GCC 14
}

build() {
  cd Tk-$pkgver

  perl Makefile.PL XFT=1 INSTALLDIRS=vendor
  sed -E 's|(^OPTIMIZE.*)|\1 -Wno-incompatible-pointer-types -Wno-implicit-int -std=gnu17|' -i Makefile
  make
}

check() {
  cd Tk-$pkgver
  xvfb-run make -j1 test
}

package() {
  cd Tk-$pkgver
  make install DESTDIR="$pkgdir"

  # license
  install -D -m644 pTk/license.terms \
                   "$pkgdir"/usr/share/licenses/$pkgname/tk.license
  install -D -m644 pTk/Tix.license \
                   "$pkgdir"/usr/share/licenses/$pkgname/tix.license
}

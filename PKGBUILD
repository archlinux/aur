# CPAN Name  : Imager
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname='perl-imager'
pkgver=1.029
pkgrel=1
pkgdesc="Perl extension for Generating 24 bit Images"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'libjpeg' 'libpng' 'giflib' 'libtiff' 'freetype2' 'glibc')
optdepends=('perl-parse-recdescent: needed to parse transform2() expressions')
makedepends=()
url='https://metacpan.org/release/Imager'
source=("https://cpan.metacpan.org/authors/id/T/TO/TONYC/Imager-${pkgver}.tar.gz")
b2sums=('cdc283129e4c31638a05810d11b0b238982450d2bf6ea0ee14947928f360eb9b8986aac711428a2e2aee507e193270458198b6c484924504ce565a022128f186')
_distdir="Imager-${pkgver}"

prepare() {
    cd "$srcdir/$_distdir"
    sed -i '/FT_FREETYPE_H/a #include FT_TYPE1_TABLES_H' FT2/freetyp2.c
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

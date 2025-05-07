# CPAN Name  : Imager
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname='perl-imager'
pkgver=1.027
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
b2sums=('4c2e8ec4b6dcbd2213f1dc9fec753612be0ef8a56ba5ced98e0d86d10498fcc2a1fa8e45108b612790d6da5dbaedb8907499030c9760518b0f2e23a2f72af8ec')
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

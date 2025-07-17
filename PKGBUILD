# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-pdl-transform-color
_dist=PDL-Transform-Color
pkgver=1.010
pkgrel=2
pkgdesc='Useful color system conversions for PDL'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz"
        "$_dist-$pkgver.patch")
sha256sums=('072168b3b896d6108a932db96a8b47701ebc344d2c24ed2304ea51df95810478'
            '3d27e3781eb1fc042ade8ac8306002ff36889963c24e9c60ad12f058b4542fba')

arch=(any)
depends=(perl perl-pdl perl-pdl-graphics-colorspace)
checkdepends=(perl-test-simple)
options=('!emptydirs')

prepare(){
  # Fixes regex issue in postamble:
  #   Unknown regexp modifier "/j" at -e line 1, at end of line
  #   syntax error at -e line 1, near "/."
  cd "$srcdir/$_dist-$pkgver"
  patch --strip=1 <"../../$_dist-$pkgver.patch"
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

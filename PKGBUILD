# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-pdl-transform-color
_dist=PDL-Transform-Color
pkgver=1.007
pkgrel=4
pkgdesc='Useful color system conversions for PDL'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz"
        "$_dist-$pkgver.patch")
sha256sums=('992392dd26f8d36ad335004869539d954138e2e8fd296b2696293ff281f9b525'
            'e5e6e301854c45c59045952ef8c3fca63b0f7fe17b748e896f4db468e0b3568c')

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

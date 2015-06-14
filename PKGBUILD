# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

_author=C/CO/CORION
_perlmod=Test-Without-Module
pkgname=perl-test-without-module
pkgver=0.18
pkgrel=2
pkgdesc='Test::Without::Module - Test fallback behaviour in absence of modules'
arch=('any')
url="http://search.cpan.org/dist/Test-Without-Module/"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl')
checkdepends=(perl-file-slurp)
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('e2c3360b171d7db518ac39a0e1dcb285c784ea393c11708914a0655d66138c7f')
build(){
  cd "$srcdir"/$_perlmod-$pkgver

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  # If using Build.PL
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

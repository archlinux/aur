# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-test-pretty
pkgver=0.32
pkgrel=1
_author="T/TO/TOKUHIROM"
_perlmod="Test-Pretty"
pkgdesc="Test::Pretty - plugin for prove"
arch=('any')
url="http://search.cpan.org/dist/Test-Pretty/"
license=('GPL' 'PerlArtistic')
depends=(perl)
checkdepends=(perl-term-encoding)
provides=(
perl-app-prove-plugin-retty
perl-tap-formatter-pretty-multi
perl-tap-formatter-pretty-multi-session
perl-tap-formatter-pretty-single
perl-tap-formatter-pretty-single-session
perl-test-pretty-harness
perl-test-pretty-parser 
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('1c8ea8054bbfd547048ae8571a7e62cc5800cbcaf637c7e5465ee0e28687f1d1')

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
  cd "$srcdir"/$_perlmod-$pkgver

  prove -lb
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make install
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build install
  fi

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

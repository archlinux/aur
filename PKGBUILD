# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_author=D/DO/DOMM
_perlmod=Module-ExtractUse
pkgname=perl-module-extractuse
pkgver=0.33
pkgrel='1'
pkgdesc="Module::ExtractUse - Find out what modules are used"
arch=('any')
url='http://search.cpan.org/dist/Module-ExtractUse'
license=('PerlArtistic' 'GPL')
depends=(
perl-parse-recdescent
perl-pod-strip
perl-test-deep
perl-test-nowarnings
perl-test-pod
perl-test-pod-coverage
perl-universal-require
)
provides=(
perl-module-extractuse-grammar
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('a65e3fcd8aee997e0c0eb0a826175758f47d5873fceddcfa450ab881ad1ce59f')
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

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make test
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build test
  fi
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

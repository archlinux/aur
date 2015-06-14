# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-cpan-reporter
pkgver=1.2011
_author=D/DA/DAGOLDEN
_perlmod=CPAN-Reporter
pkgrel=1
pkgdesc='CPAN::Reporter - Adds CPAN Testers reporting to CPAN.pm'
arch=('any')
url="http://search.cpan.org/dist/CPAN-Reporter/"
license=('GPL' 'PerlArtistic')
depends=(
perl-capture-tiny 
perl-config-tiny
perl-devel-autoflush
perl-test-reporter 
)
makedepends=(
perl-capture-tiny 
perl-config-tiny
perl-devel-autoflush
perl-test-reporter 
)
checkdepends=(
perl-file-copy-recursive
perl-file-pushd
perl-io-captureoutput 
)
optdepends=('perl-test-reporter-transport-metabase: Metabase transport')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
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
sha256sums=('0154f3cf6af5f20002fea34ae3b69a0300dcfc52000fea729aac4a3fa91f08fb')

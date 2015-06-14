# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-cpan-testers-report
pkgver=1.999002
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="CPAN-Testers-Report"
pkgdesc="CPAN::Testers::Report - CPAN Testers report object"
arch=('any')
url="http://search.cpan.org/dist/CPAN-Testers-Report/"
license=('GPL' 'PerlArtistic')
depends=(
perl-metabase-fact
)
makedepends=(
perl-metabase-fact
)
provides=(
perl-cpan-testers-fact-installedmodules
perl-cpan-testers-fact-legacyreport
perl-cpan-testers-fact-perlconfig
perl-cpan-testers-fact-prereqs
perl-cpan-testers-fact-testenvironment
perl-cpan-testers-fact-testoutput
perl-cpan-testers-fact-testsummary
perl-cpan-testers-fact-testercomment
)
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

md5sums=('123cdff64831f3fce9c943ec83ac2626')

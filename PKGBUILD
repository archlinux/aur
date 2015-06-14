# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_author=T/TH/THALJEF
_perlmod=Perl-Critic-More
pkgname=perl-critic-more
pkgver=1.003
pkgrel=1
pkgdesc='Perl::Critic::More - Supplemental policies for Perl::Critic'
arch=('any')
url="http://search.cpan.org/dist/Perl-Critic-More/"
license=('GPL' 'PerlArtistic')
depends=(
perl
)
makedepends=(
perl
)
provides=(
perl-perl-critic-policy-codelayout-requireascii
perl-perl-critic-policy-editor-requireemacsfilevariables
perl-perl-critic-policy-errorhandling-requireuseofexceptions
perl-perl-critic-policy-modules-perlminimumversion
perl-perl-critic-policy-modules-requireperlversion
perl-perl-critic-policy-valuesandexpressions-requireconstantonleftsideofequality
perl-perl-critic-policy-valuesandexpressions-restrictlongstrings
)
options=(!emptydirs)
source=("http://cpan.perl.org/modules/by-authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('69e2acff61b7bead745721991e2b83c88624ae8239d4371a785a3ce2d967187b')

build(){
  cd "$srcdir"/$_perlmod-$pkgver

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  if [ -r Makefile.PL ]; then
    make test
  elif [ -r Build.PL ]; then
    perl Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  if [ -r Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  elif [ -r Build.PL ]; then
    perl Build install installdirs=vendor destdir="$pkgdir"
  fi

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

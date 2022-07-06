# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=perl-data-password
pkgver=1.12
pkgrel=1
_author="R/RA/RAZINF"
_perlmod="Data-Password"
pkgdesc="Data::Password - Perl extension for assessing password quality"
arch=('any')
url="http://search.cpan.org/dist/Data-Password/"
license=('PerlArtistic')
depends=('perl')
makedepends=()
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
sha512sums=('bc7e8c31d1b9f6e986cd012a26f268f1c5924fa6743b32d2ed5770f6749390325874ce4bb01888b239cdcc8df85a714796a3adc2b2b5ffb70770435687b7cbcf')

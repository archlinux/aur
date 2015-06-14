# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: <firmicus ατ gmx δοτ net>

_author=B/BR/BRICKER
_perlmod=Config-Std
pkgname=perl-config-std
pkgver=0.901
pkgrel=1
pkgdesc="Config::Std - Load and save configuration files in a standard format"
arch=('any')
url="http://search.cpan.org/dist/Config-Std"
license=('GPL' 'PerlArtistic')
depends=(perl-class-std)
makedepends=(perl-class-std)
provides=(
perl-config-std-block
perl-config-std-comment
perl-config-std-gap
perl-config-std-hash
perl-config-std-keyval
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
  # https://rt.cpan.org/Public/Bug/Display.html?id=85956
  return 0
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
md5sums=('e18f550af8d402e245edb7927c73fd4c')

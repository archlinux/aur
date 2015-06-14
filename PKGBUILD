# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-padre-plugin-perl6
pkgver=0.71
pkgrel=1
_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-Perl6
pkgdesc='Padre::Plugin::Perl6 - Perl 6 Support for Padre'
arch=('any')
url="http://search.cpan.org/dist/Padre-Plugin-Perl6/"
license=('GPL' 'PerlArtistic')
depends=(
perl-padre
perl-grok
perl-perl6-doc
perl-syntax-highlight-perl6
)
makedepends=(perl)
provides=(
perl-padre-plugin-perl6-colorizer
perl-padre-plugin-perl6-document
perl-padre-plugin-perl6-help
perl-padre-plugin-perl6-outline
perl-padre-plugin-perl6-preferences
perl-padre-plugin-perl6-quickfix
perl-padre-plugin-perl6-stdcolorizer
perl-padre-plugin-perl6-stdcolorizertask
perl-padre-plugin-perl6-syntax
perl-padre-plugin-perl6-util 
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
md5sums=('7cb9b3cc1d65b53048215d791be34cc3')

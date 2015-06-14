# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-grok
pkgver=0.26
pkgrel=1
_author=H/HI/HINRIK
_perlmod=grok
pkgdesc="App::Grok - Does most of grok's heavy lifting"
arch=('any')
url="http://search.cpan.org/dist/grok/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-io-socket-ssl
perl-perl6-doc
perl-perl6-perldoc
perl-perl6-perldoc-to-ansi
perl-pod-text-ansi
perl-pod-xhtml
)
makedepends=(perl)
provides=(
perl-app-grok
perl-app-grok-common
perl-app-grok-parser-pod5
perl-app-grok-parser-pod6
perl-app-grok-resource-file
perl-app-grok-resource-functions
perl-app-grok-resource-spec
perl-app-grok-resource-tablet
perl-app-grok-resource-u4x
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
# env
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
  msg2 "Skipping check()"
  return

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
md5sums=('16e75598958bf3266d10b8f95c4249d8')

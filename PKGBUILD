# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author='A/AD/ADAMK'
_perlmod=ORLite-Migrate
pkgname=perl-orlite-migrate
pkgver=1.10
pkgrel=2
pkgdesc="ORLite::Migrate - Extremely light weight SQLite-specific schema migration'"
arch=(any)
url="http://search.cpan.org/dist/ORLite-Migrate"
license=('PerlArtistic' 'GPL')
depends=(
perl-file-pushd
perl-dbd-sqlite
'perl>=5.10.1'
perl-params-util
perl-probe-perl
perl-ipc-run3
perl-dbi
perl-orlite
)
makedepends=()
provides=(
perl-orlite-migrate-patch
perl-orlite-migrate-timeline
)
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz)

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
md5sums=('7f311c18c385e053ec8543c3f9c7761c')
md5sums=('a397c8cecde0ed2ecbe5461f8064bbcb')

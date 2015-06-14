# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-archive-any-lite
pkgver=0.10
pkgrel=1
_author="I/IS/ISHIGAKI"
_perlmod="Archive-Any-Lite"
pkgdesc="Archive::Any::Lite - simple CPAN package extractor  "
arch=('any')
url="http://search.cpan.org/dist/Archive-Any-Lite/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
checkdepends=(perl-test-useallmodules)
makedepends=(perl-archive-zip perl-extutils-makemaker-cpanfile perl-module-cpanfile)
depends=(perl-archive-zip)
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
sha256sums=('b97fd4b61c8ff4a0d1dd2be50799fa1430add0bb55c1d35598874cd6974d68c5')

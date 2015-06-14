# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=perl-tk-difftext
pkgver=0.19
pkgrel=1
_author="M/MJ/MJCARMAN"
_perlmod="Tk-DiffText"
pkgdesc="TK-DiffText - Perl/Tk composite widget for colorized diffs"
arch=('any')
url="http://search.cpan.org/dist/perl-tk-difftext/"
license=('GPL' 'PerlArtistic')
depends=(perl-tk perl-algorithm-diff perl-tie-tk-text)
makedepends=(perl-tk perl-algorithm-diff perl-tie-tk-text)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.zip")
sha256sums=('e0bf0f660074550753a44d3be7dfbcbf921a140bc52e7c4cb742dc4e307237b3')
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

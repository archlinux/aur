# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=tidyview
pkgver=1.14
pkgrel=1
pkgdesc='Preview the effect of perltidy options on your source code'
arch=('any')
url='http://sourceforge.net/projects/tidyview/'
license=('GPL')
depends=(perl-tk-difftext)
makedepends=(perl-log-log4perl perl-tk)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::http://downloads.sourceforge.net/project/tidyview/tidyview/tidyview-${pkgver}/tidyview-${pkgver}.tar.gz")

build(){
  cd "$srcdir"/$pkgname-$pkgver

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
  cd "$srcdir"/$pkgname-$pkgver
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
  cd "$srcdir"/$pkgname-$pkgver

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

sha256sums=('3cc0a7c8b662063a13de87cbfb3d5156751928aeb2c1aae35ad38bb8091febaf')

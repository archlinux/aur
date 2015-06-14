# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_author=J/JU/JUDITH
_perlmod=Linux-Distribution-Packages
pkgname=perl-linux-distribution-packages
pkgver=0.05
pkgrel=4
pkgdesc='Linux::Distribution::Packages - list all packages on various Linux distributions'
arch=('any')
url="http://search.cpan.org/dist/Linux-Distribution-Packages/"
license=('GPL' 'PerlArtistic')
depends=(
perl-linux-distribution
perl-xml-writer
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz"
arch.patch
)
sha256sums=('0879aaa0e0c03c0dcd02f7692f7f7f5fcd6c801435ee61603a1de2e76d99e4bd'
            '2c667e554155e2acf415e5fcc5662b09fd0c7e7a547eef4785619c702fc51186')
prepare(){
  cd "$srcdir"/$_perlmod-$pkgver
  patch -p0 -i "$srcdir"/arch.patch
}
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

# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname='perl-module-install'
_perlmod=Module-Install
_author='B/BI/BINGOS'
pkgver=1.14
pkgrel=1
pkgdesc="Module::Install - Standalone, extensible Perl module installer"
arch=('any')
url='http://search.cpan.org/dist/Module-Install'
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
perl-file-remove
perl-json
perl-module-scandeps
perl-par-dist
perl-parse-cpan-meta
perl-yaml-tiny
)
makedepends=(perl-yaml-tiny)
source=(http://search.cpan.org/CPAN/authors/id/${_author}/${_perlmod}-${pkgver}.tar.gz)
sha256sums=('3f02f0a33603aff2f5cf06d15f74d1a9be65e844ada99e1a9c2102330ffa0d49')
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

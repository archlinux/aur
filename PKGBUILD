# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-archive-any
pkgver=0.0942
pkgrel=1
_author="O/OA/OALDERS"
_perlmod="Archive-Any"
pkgdesc="Archive::Any - Single interface to deal with file archives"
arch=('any')
url="http://search.cpan.org/dist/Perl-Archive-Any/"
license=('GPL' 'PerlArtistic')
depends=(
perl-archive-tar
perl-archive-zip
perl-module-find
perl-module-build
perl-file-mmagic
perl-mime-types
)
provides=(
perl-archive-any-plugin
perl-archive-any-plugin-tar
perl-archive-any-plugin-zip
perl-archive-any-tar
perl-archive-any-zip
)
checkdepends=(perl-test-warn)
makedepends=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('552fb7a086e4a950c707c730b90c04af52e597635692a26a41d8665f1b371b2d')

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


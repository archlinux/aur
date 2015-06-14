# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=perl-file-find-object
pkgver=v0.2.12
pkgrel=1
_author="S/SH/SHLOMIF"
_perlmod="File-Find-Object"
pkgdesc="File::Find::Object - An object oriented File::Find replacement"
arch=('any')
url="http://search.cpan.org/dist/File-Find-Object/"
license=('GPL' 'PerlArtistic')
depends=(perl)
checkdepends=()
makedepends=(perl-class-xsaccessor)
provides=(
perl-file-find-object-base
perl-file-find-object-deeppath
perl-file-find-object-pathcomp
perl-file-find-object-result
perl-file-find-object-toppath
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('c11275cbc4456956bbe2b39630ed2be1bfa4da46e467babfd3e048f23ad1c9f2')
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

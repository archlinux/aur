# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-devel-platform-info
pkgver=0.15
pkgrel=1
_author="B/BA/BARBIE"
_perlmod="Devel-Platform-Info"
pkgdesc="Devel::Platform::Info - Unified framework for obtaining common platform metadata"
arch=('any')
url="http://search.cpan.org/dist/Devel-Platform-Info/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
provides=(
perl-devel-platform-info-bsd
perl-devel-platform-info-irix
perl-devel-platform-info-linux
perl-devel-platform-info-mac
perl-devel-platform-info-sco
perl-devel-platform-info-solaris
perl-devel-platform-info-win32
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('d2dbba1fbb2458c7c8c1b3b5d079dd4dca0adce7b7536c3ccddb3135d744338b')
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

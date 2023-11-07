_author=B/BD/BDFOY
_perlmod=Module-Release
pkgname=perl-module-release
pkgver=2.133
pkgrel=1
pkgdesc="Module::Releases - automate software releases"
arch=('any')
url="https://metacpan.org/release/Module-Release/"
license=('GPL' 'PerlArtistic')
depends=(
perl-configreader-simple
perl-io-null
perl-test-without-module
)
makedepends=(
perl-test-output
perl-test-pod-coverage
perl-mojolicious
)
provides=(
'perl-module-release-ftp'
'perl-module-release-kwalitee'
'perl-module-release-manifest'
'perl-module-release-pause'
'perl-module-release-prereq'
'perl-module-release-svn'
'perl-module-release-webupload-mojo'
)
optdepends=(
'perl-cacertorg-ca'
'perl-lwp-protocol-https: for https support for LWP::UserAgent'
'perl-test-prereq: to check prereqs'
)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz"
#encoding.patch
)
sha256sums=('1c386000b0579db9a62f13e6cc0b800ebbaeee1ac556b534a909d41b8b258a5a')
build(){
  cd "$srcdir"/$_perlmod-$pkgver

#  patch -p1 < "$srcdir"/encoding.patch

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

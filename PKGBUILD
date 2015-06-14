# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=A/AW/AWWAIID
_perlmod=Devel-ebug
pkgname=perl-devel-ebug
pkgver=0.55
pkgrel=1
pkgdesc='Devel::ebug - A simple, extensible Perl debugger'
arch=('any')
url='http://search.cpan.org/dist/Devel-ebug/'
license=('GPL' 'PerlArtistic')
groups=()
depends=(
   'perl-test-expect'
   'perl-class-accessor-chained'
   'perl-proc-background'
   'perl-string-koremutake'
   'perl-devel-stacktrace>=1.27'
)
makedepends=('perl-yaml')
optdepends=()
provides=(
   'perl-devel-ebug-backend-plugin-actionpoints'
   'perl-devel-ebug-backend-plugin-basic'
   'perl-devel-ebug-backend-plugin-codelines'
   'perl-devel-ebug-backend-plugin-commands'
   'perl-devel-ebug-backend-plugin-eval'
   'perl-devel-ebug-backend-plugin-filenames'
   'perl-devel-ebug-backend-plugin-output'
   'perl-devel-ebug-backend-plugin-pad'
   'perl-devel-ebug-backend-plugin-ping'
   'perl-devel-ebug-backend-plugin-run'
   'perl-devel-ebug-backend-plugin-stacktrace' 
   'perl-devel-ebug-console' 
   'perl-devel-ebug-plugin-actionpoints' 
   'perl-devel-ebug-plugin-basic' 
   'perl-devel-ebug-plugin-codelines'
   'perl-devel-ebug-plugin-eval' 
   'perl-devel-ebug-plugin-filenames'
   'perl-devel-ebug-plugin-output'
   'perl-devel-ebug-plugin-pad'
   'perl-devel-ebug-plugin-run'
   'perl-devel-ebug-plugin-stacktrace'
   'perl-db-fake'
)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

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

  cd $pkgdir/usr/bin/vendor_perl || return 1
  mv ebug_client ebug-client || return 1
  mv ebug_server ebug-server || return 1
}
md5sums=('44697667bb9603483e1e9c33314df259')

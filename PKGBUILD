# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Kent Fredric <kentnl@cpan.org>
# Contributor: Petrenko Alexey <alexey-p at uralweb dot ru>

pkgname=perl-devel-nytprof
pkgver=5.07
pkgrel=3
_author='T/TI/TIMB'
_perlmod='Devel-NYTProf'
pkgdesc='Devel::NYTProf - Powerful fast feature-rich perl source code profiler'
url='http://search.cpan.org/dist/Devel-NYTProf'
depends=(
perl-json-any
perl-getopt-long
perl-test-simple
perl-xsloader
perl-test-differences
)
checkdepends=(
# perl-moose
# perl-test-portability-files
perl-test-pod-coverage
)
makedepends=(perl-extutils-makemaker)
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha1sums=('a6608e7ba2814960efeb8f364bd0f6894fd1b6b9')
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
    HARNESS_OPTIONS=j10 make test
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
  install -dm755 "$pkgdir"/usr/bin
  # for nytprofhtml
  ln -s /usr/bin/vendor_perl/nytprofcalls "$pkgdir"/usr/bin/nytprofcalls
  ln -s /usr/bin/vendor_perl/flamegraph.pl "$pkgdir"/usr/bin/flamegraph.pl
}

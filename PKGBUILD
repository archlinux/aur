# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-ical'
pkgver='0.24'
pkgrel='1'
pkgdesc="Perl/CPAN Module Data::ICal: Generates iCalendar (RFC 2445) calendar files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.12' 'perl-class-accessor' 'perl-class-returnvalue' 'perl-text-vfile-asdata')
makedepends=()
checkdepends=('perl-test-longstring' 'perl-test-nowarnings' 'perl-test-warn')
url='https://metacpan.org/release/Data-ICal'
source=("https://cpan.metacpan.org/authors/id/B/BP/BPS/Data-ICal-$pkgver.tar.gz");
md5sums=('f90c55d07a03172f5f5ef516e8d45d3d')
sha512sums=('592cc76dd8dd00d8ce365a7105c6b732ecb94838876d6b430f1f3078e8674f9584c5a6248c5ec5ebbee9d35f3758d9709d45e70728899c528d030424abe81d9e')
_distdir="Data-ICal-$pkgver"

prepare() {
  cd "$srcdir/$_distdir"

  # Patch Makefile.PL
  # by adding "use lib '.';" before "use inc::Module::Install".
  # Maybe a real patch-file would be better.
  #
  # This fixes the "Can't locate inc/Module/Install.pm in @INC"-error,
  # which isn't upstream yet, when doing "make".
  # See https://rt.cpan.org/Public/Bug/Display.html?id=120825
  # for details on this problem (but for a different Perl/CPAN-module).
  #
  sed -i "s/use inc::Module::Install/use lib '.';\nuse inc::Module::Install/" Makefile.PL
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

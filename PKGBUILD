# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sms-send'
pkgver='1.06'
pkgrel='1'
pkgdesc="Perl/CPAN Module SMS::Send: Driver-based API for sending SMS messages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-adapter>=1.05' 'perl-module-pluggable>=3.7' 'perl-params-util>=1.00' 'perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/SMS-Send'
source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/SMS-Send-$pkgver.tar.gz")
md5sums=('bf8c79fb145883c3cd475e5687201151')
sha512sums=('7e4fd12d9a8fd1f9a2b77ea441c146becd03b4cacd84d167ded3d569889c797ef8def3293b8996786a6d577274c12c4c8d8a2724a2365012c0f35966d85b313d')
_distdir="SMS-Send-$pkgver"

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

# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: Ruben Kelevra <ruben@vfn-nrw.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-returnvalue'
pkgver='0.55'
pkgrel='5'
pkgdesc="Perl/CPAN Module Class::ReturnValue: A smart return value object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-stacktrace')
makedepends=()
url='https://metacpan.org/release/Class-ReturnValue'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Class-ReturnValue-0.55.tar.gz')
md5sums=('047fbbcfd90d5c399a1feba55781329e')
sha512sums=('27aecf99a7db6c943c5300048a4e51aa7646fc83d2a6494f24a68fc76755a9e565099fa830e7f745b76c9ab1b2a8c5ac2a90cf3b22f250245413923bf03b315c')
_distdir="Class-ReturnValue-0.55"

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

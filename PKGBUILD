# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-fromhtml'
pkgver='0.31'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::FromHTML: Convert HTML documents to PDF"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-graphics-colornames' 'perl-image-size' 'perl-pdf-writer>=0.05' 'perl-xml-twig' 'perl-libwww' 'perl>=5.6.0')
makedepends=()
checkdepends=('perl-html-tidy')
url='https://metacpan.org/release/PDF-FromHTML'
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/PDF-FromHTML-$pkgver.tar.gz")
md5sums=('8bdc40824ca74007308f28503f52b36c')
sha512sums=('3023813d3ef332431be0fe2b5eb6a4a5d05b5907981db36c05f5e63a2012c1a7ee96bf30ca69d33492bbf9b2db17419429491ca500a915c8512a2148f05afbde')
_distdir="PDF-FromHTML-$pkgver"

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

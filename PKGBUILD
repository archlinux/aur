# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-attribute-env'
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl/CPAN Module MooseX::Attribute::ENV: Set default of an attribute to a value from %ENV"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.48' 'perl>=5.8.6')
makedepends=()
url='https://metacpan.org/release/MooseX-Attribute-ENV'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/MooseX-Attribute-ENV-$pkgver.tar.gz")
md5sums=('e26364e1276f24b8df6cbf49b83fd1f6')
sha512sums=('11c6227736732a9962039ebbcbaa11bf8f17571b0a4c8d390913b4df680d06bd96c4db5243c9a0be3aaea1f646ace745d85929ae957aa523d732ec85293db5de')
_distdir="MooseX-Attribute-ENV-$pkgver"

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

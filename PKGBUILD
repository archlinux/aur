# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-sexy
_cpanname=Gtk2-Sexy
pkgver=0.05
pkgrel=13
pkgdesc="Perl/CPAN Module Gtk2::Sexy"
arch=('i686' 'x86_64')
url="http://search.cpan.org/perldoc?Gtk2::Sexy"
license=('LGPL')
depends=('gtk2-perl' 'libsexy')
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends' 'perl-module-install')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/$_cpanname-$pkgver.tar.gz")
md5sums=('3e291808250d7b956ba8443013a1b461')

build() {
  cd $_cpanname-$pkgver
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                  \
      PERL_AUTOINSTALL=--skipdeps                             \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"      \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"  \
      MODULEBUILDRC=/dev/null

    /usr/bin/perl Makefile.PL
    sed 's,build\/doc\.pl,./build/doc.pl,g' -i Makefile
    make
  )
}
package() {
  cd $_cpanname-$pkgver
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

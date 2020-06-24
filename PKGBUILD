# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=glade-perl
_cpanname=Gtk2-GladeXML
pkgver=1.007
pkgrel=18.1
pkgdesc="Gtk2-GladeXML perl bindings for glade 2.x"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('LGPL' 'PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
depends=('libglade' 'gtk2-perl' 'perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TS/TSCH/${_cpanname}-${pkgver}.tar.gz")
md5sums=('e6ca234e2a9f0221263acd2a593c583b')

build() {
  cd  $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  sed -e 's,q(build/doc.pl),q(./build/doc.pl),g' -i Makefile
  make
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd  $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}

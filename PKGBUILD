# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-glib-ev
pkgver=2.02
pkgrel=13
pkgdesc="Coerce Glib into using the EV module as event loop"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?Glib::EV'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Glib-EV-${pkgver}.tar.gz")
depends=('glib-perl' 'perl-ev')
makedepends=('perl-extutils-pkgconfig')
sha512sums=('1dd382c969b0a425df406e46d670bb50dcd168c381055ff3f361a2ee662a69065c782cf7952070e4bd133842449c8945185bfaf10665a3e2a1ed8c190cd065be')

build() {
	cd "$srcdir/Glib-EV-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
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
	cd "$srcdir/Glib-EV-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
	_perl_depends
}

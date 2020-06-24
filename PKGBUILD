# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-ev-glib
pkgver=2.01
pkgrel=15
pkgdesc="Embed the glib main loop into EV"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?EV::Glib'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/EV-Glib-${pkgver}.tar.gz")
depends=('glib-perl' 'perl-ev')
makedepends=('perl-extutils-pkgconfig')
sha512sums=('2e042a0e460a55ab7499c2a82adc13afbb4815edeb8601eb3a7642dbdfa6a2e3d19d75e6b5b508b7962aa4e26473ff54fc5953381ba6373fa13faf75420f65b3')

build() {
	cd "$srcdir/EV-Glib-$pkgver"

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
	cd "$srcdir/EV-Glib-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
	_perl_depends
}

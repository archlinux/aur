# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-io-interface
pkgver=1.09
pkgrel=9
pkgdesc="Perl extension for access to network card configuration information"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?IO::Interface'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LD/LDS/IO-Interface-${pkgver}.tar.gz")
depends=('glibc')
makedepends=('perl-module-build')
md5sums=('806f97aff5a7361b6f54cd494f4cc9fd')
sha512sums=('a23a4793e23ba0fbb0583c6692d7138e4a9b0a6959c9fa81489954090fa51ca6edfe79841a8f69ab7f7a52aec31a477cb01705f6d66d5c7e8b69f76301360cd5')

build() {
	cd "$srcdir/IO-Interface-$pkgver"

	# install module in vendor directories
	perl Build.PL --installdirs vendor
	./Build
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
	cd "$srcdir/IO-Interface-$pkgver"
	./Build --installdirs vendor destdir="$pkgdir/" install

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
	_perl_depends
}

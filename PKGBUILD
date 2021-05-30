# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-b-hooks-op-check
_cpanname="B-Hooks-OP-Check"
pkgver=0.22
pkgrel=1.1
pkgdesc="Wrap OP check callbacks"
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~flora/$_cpanname/"
options=('!emptydirs')
depends=('perl>=5.5.0')
makedepends=('perl-extutils-depends' 'perl-module-install')
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/$_cpanname-$pkgver.tar.gz")
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/$_cpanname-$pkgver.tar.gz")
md5sums=('b02925eacea03913a922f4b45020b5ac')

# Function to change to the working directory and set
# environment variables to override undesired options.
prepareEnvironment() {
	cd "$srcdir/$_cpanname-$pkgver"
	export \
		PERL_MM_USE_DEFAULT=1 \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
}

build() {
	prepareEnvironment
	/usr/bin/perl Makefile.PL
	make
}

check() {
	prepareEnvironment
	make test
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
	prepareEnvironment
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
	_perl_depends
}

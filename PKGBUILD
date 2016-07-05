# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname='perl-starlet'
_cpanname='Starlet'
pkgver='0.16'
pkgrel='1'
pkgdesc='A simple, high-performance PSGI/Plack HTTP server.'
arch=('any')
license=(
	'GPL'
	'PerlArtistic'
)
options=('!emptydirs')
depends=(
	'perl-parallel-prefork>=0.13'
	'perl-plack>=0.992'
	'perl-server-starter>=0.06'
	'perl>=5.8.1'
)
makedepends=('perl-test-tcp>=0.15')
url="http://search.cpan.org/dist/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/$_cpanname-$pkgver.tar.gz")
sha256sums=('0136f353195efa8d422748e0f4f9b10fc204d6132b391f1d9c753fb6ba3d997a')

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

package() {
	prepareEnvironment
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Maintainer: ajs124 < aur AT ajs124 DOT de >
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-ipc-sharelite
_cpanname="IPC-ShareLite"
pkgver=0.17
pkgrel=3
pkgdesc="Lightweight interface to shared memory"
arch=('i686' 'x86_64' 'armv6h')
url="http://search.cpan.org/~andya/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/$_cpanname-$pkgver.tar.gz")
sha512sums=('f796f6766df11205755de4672ff8a586690545ccaa2f91c3fc65f106f3b61e1cbd86ee3e97dadf787809e3be32f503670cb67dafc9b18eee30d59d8be03b5ee9')

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
	perl Makefile.PL
	make
}

check() {
	prepareEnvironment
    cd "$srcdir/$_cpanname-$pkgver"
	make test
}

package() {
	prepareEnvironment
    cd "$srcdir/$_cpanname-$pkgver"
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

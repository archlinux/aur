# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Justin Davis <jrcd83@gmail.com>

pkgname=perl-sub-name
_cpanname="Sub-Name"
pkgver=0.14
pkgrel=1
pkgdesc="(re)name a sub"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc')
url="http://search.cpan.org/dist/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/$_cpanname-$pkgver.tar.gz")
md5sums=('211ca38767145b6c362da3b821a5abca')

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

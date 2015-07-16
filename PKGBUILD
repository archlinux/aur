# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Packager: AUR Perl <aurperl@juster.info>

pkgname=perl-scope-guard
_cpanname="Scope-Guard"
pkgver=0.20
pkgrel=2
pkgdesc="Lexically-scoped resource management"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.5.0')
url="http://search.cpan.org/~chocolate/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/$_cpanname-$pkgver.tar.gz")
md5sums=('495d5ae16a2df8128fd068c386c9d4ac')

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

# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
# Based on the AUR3 package from Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: AUR Perl <aurperl@juster.info>

pkgname='perl-server-starter'
_cpanname='Server-Starter'
pkgver='0.31'
pkgrel='1'
pkgdesc='A superdaemon for hot-deploying server programs.'
arch=('any')
license=(
	'PerlArtistic'
	'GPL'
)
options=('!emptydirs')
depends=(
	'perl-list-moreutils'
	'perl-proc-wait3'
	'perl-scope-guard'
)
makedepends=('perl-test-tcp>=0.11')
url="http://search.cpan.org/dist/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/$_cpanname-$pkgver.tar.gz")
md5sums=('48a6cca38adeb57878d5339891dcfacf')

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
	/usr/bin/perl Build.PL
	./Build
}

check() {
	prepareEnvironment
	./Build test
}

package() {
	prepareEnvironment
	./Build install --installdirs=vendor --destdir="$pkgdir"

# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}


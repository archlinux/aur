# Maintainer: Nícolas F. R. A. Prado <n at nfraprado dot net>
pkgname=lei-git
pkgver=1.7.0.r32.f1e4e14793d1
pkgrel=1
pkgdesc='The "local email interface" from public-inbox'
arch=('any')
url="https://public-inbox.org"
license=('AGPL')
depends=(perl perl-inline-c perl-dbd-sqlite perl-search-xapian perl-uri)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" public-inbox-git public-inbox)
options=('!emptydirs' purge)
source=("${pkgname%-git}::git+https://public-inbox.org/")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(
			git describe --long | sed \
			-e 's/\([^-]*-\)g/r\1/;s/-/./g' \
			-e 's/^v//'
	)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make check
}

package() {
	cd "$srcdir/${pkgname%-git}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make DESTDIR="$pkgdir/" install
	# There's currently no way to build/install only lei in the public-inbox
	# Makefile, so we need to manually delete the public-inbox binaries and
	# manpages.
	rm "$pkgdir/usr/bin/site_perl/public-inbox"*
	rm "$pkgdir/usr/share/man/"*"/public-inbox"*
}

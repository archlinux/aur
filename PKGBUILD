# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=public-inbox-git
pkgver=1.7.0.r0.e3056686
pkgrel=1
pkgdesc='An "archives first" approach to mailing lists'
arch=('any')
url="https://public-inbox.org"
license=('GPL')
depends=(perl perl-timedate perl-digest-sha perl-email-mime perl-plack perl-uri)
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
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
}

# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-math-currency
_lastauthor=M/MS/MSCHOUT
_pkgname=Math-Currency
pkgver=0.52
pkgrel=3
pkgdesc="Exact Currency Math with Formatting and Rounding"
arch=('any')
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
depends=('perl' 'perl-encode-locale')
makedepends=('perl-extutils-makemaker')
checkdepends=()
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('f440826f7fa7480f43576c1d7f5f6e5b868e961af918047f592b299b64244429ec167c1a5869e2cfe514ddc90ae2019bbd36c1288ca07f7a3e0a672e735e4bee')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	msg2 "Creating extra currency modules from your /etc/locale.gen"
	for i in $(locale -a|grep -- '^.._..$'); do
		scripts/new_currency $i || true
	done
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null

	perl Makefile.PL
	make
}
check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make test
}
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make install
}

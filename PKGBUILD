# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tools-git
pkgver=3.0.2.r868.c191fd28
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 tools based on tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('curl' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'ibm-sw-tpm2' 'python-yaml' 'tpm2-abrmd' 'vim')
optdepends=('tpm2-abrmd: user space resource manager')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	sed --in-place 's|@CODE_COVERAGE_RULES@|include $(top_srcdir)/aminclude_static.am|' Makefile.am
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && _opts=('--enable-unit')
	./configure --prefix=/usr "${_opts[@]}"
	make
}

check() {
	cd "${pkgname%-git}"
	dbus-run-session -- make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

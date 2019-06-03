# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine-git
pkgver=1.0.0.r26.0bd2b64
pkgrel=1
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'expect' 'ibm-sw-tpm2' 'iproute2' 'tpm2-tools-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"

	# https://github.com/tpm2-software/tpm2-tss-engine/pull/119
	# Revert to using tpm2-tools-git until tpm2-tools 3.2 is released
	git revert --no-commit 6c31844e86bbeb56c6c5d78e91e703e7cae26ab3

	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && _opts=('--enable-unit' '--enable-integration')
	./configure --prefix=/usr "${_opts[@]}"
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

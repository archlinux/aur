# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine
pkgver=1.0.0
pkgrel=3
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss')
checkdepends=('cmocka' 'expect' 'ibm-sw-tpm2' 'tpm2-tools-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        'tpm2-tss-engine_check.sh'
        "test-migrate-tpm2_create-option-from-A-to-b.patch::$url/commit/4c770f836c916abe968901ff9f06bb611812cb4a.patch"
        'Tests-Fix-for-latest-tools.patch')
sha512sums=('b06722c82c9cefd5184125b26fb46bd7b20d62631c21c51a028348833c4786b41ff64f2c1cb7d53f749a6cf35b8fae02ae02285fc43d1d044e2d2b6e2e7048a3'
            'SKIP'
            '77d0d1789376e76b1f357edea59e5cd0953cfcf33c35069da6c4092c43e028dfb1e1593e3c85456e590f9da8252701519a06a5eb94adf8501cf4e5f21cc92cf1'
            '8441bf0eab24b0aee8b67996079f94c0fca9138dd6bc95f595e24bafe71a49923eb08120c2573789b821c63900be99e9b4be7060bb3dd1170c6725d9ba06a8e7'
            '5cf0967cf50c889ee776b0f2e6e87622e7d89119c2c5ed02cafe86fe35ee97f6f2d6e7f7c6236b069b51e7daa970f54ba38182278bfa0ae1fe699399488034b6')
validpgpkeys=('D6B4D8BAC7E0CC97DCD4AC7272E88B53F7A95D84') # Andreas Fuchs

prepare() {
	cd "$pkgname-$pkgver"
	# https://github.com/tpm2-software/tpm2-tss-engine/issues/106
	patch --strip=1 --input="$srcdir/test-migrate-tpm2_create-option-from-A-to-b.patch"
	# https://github.com/tpm2-software/tpm2-tss-engine/issues/112
	patch --strip=1 --input="$srcdir/Tests-Fix-for-latest-tools.patch"
}

build() {
	cd "$pkgname-$pkgver"
	(( CHECKFUNC )) && _opts=('--enable-unit' '--enable-integration')
	./configure --prefix=/usr --enable-tctienvvar "${_opts[@]}"
	make
}

check() {
	cd "$pkgname-$pkgver"
	"$srcdir/tpm2-tss-engine_check.sh"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

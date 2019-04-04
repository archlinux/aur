# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine
pkgver=1.0.0
pkgrel=1
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss')
checkdepends=('cmocka' 'expect' 'ibm-sw-tpm2' 'tpm2-tools-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        'tpm2-tss-engine_check.sh')
sha512sums=('b06722c82c9cefd5184125b26fb46bd7b20d62631c21c51a028348833c4786b41ff64f2c1cb7d53f749a6cf35b8fae02ae02285fc43d1d044e2d2b6e2e7048a3'
            'SKIP'
            '77d0d1789376e76b1f357edea59e5cd0953cfcf33c35069da6c4092c43e028dfb1e1593e3c85456e590f9da8252701519a06a5eb94adf8501cf4e5f21cc92cf1')
validpgpkeys=('D6B4D8BAC7E0CC97DCD4AC7272E88B53F7A95D84') # Andreas Fuchs

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

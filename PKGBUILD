# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tpm2-tss-engine
pkgver=1.0.1
pkgrel=2
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss')
checkdepends=('cmocka' 'expect' 'ibm-sw-tpm2' 'tpm2-tools')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        'tpm2-tss-engine_check.sh'
        'tpm2-tss-engine-1.0.1-tpm2-tools-4.0.patch')
sha512sums=('106fc6aadf0b4b27c3b38be596356aa59b4b76ec1602e8c5564aec6b4be7e2b5d6077006ee13d41e58402255b879aadaa966c758b5b326ae32742007ce2ef238'
            'SKIP'
            '77d0d1789376e76b1f357edea59e5cd0953cfcf33c35069da6c4092c43e028dfb1e1593e3c85456e590f9da8252701519a06a5eb94adf8501cf4e5f21cc92cf1'
            'bf73ef8834fc92c1a85b590e0dd69e9d0a465533e631768652fdd0e316f590fa5a16fdcc7faf9af360b6b05a508d904f3657e7c476c136b2000e3374e2a3606d')
validpgpkeys=('D6B4D8BAC7E0CC97DCD4AC7272E88B53F7A95D84') # Andreas Fuchs

prepare() {
	cd "$pkgname-$pkgver"
	# Use tpm2-tools 4.0 for tests (backport of GitHub PR #142)
	patch --strip=1 --input="$srcdir/tpm2-tss-engine-1.0.1-tpm2-tools-4.0.patch"
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

# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine-git
pkgver=1.0.0.r8.a063e24
pkgrel=2
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'expect' 'ibm-sw-tpm2' 'tpm2-tools-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'tpm2-tss-engine-git_check.sh')
sha512sums=('SKIP'
            '77d0d1789376e76b1f357edea59e5cd0953cfcf33c35069da6c4092c43e028dfb1e1593e3c85456e590f9da8252701519a06a5eb94adf8501cf4e5f21cc92cf1')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"

	# https://github.com/tpm2-software/tpm2-tss-engine/issues/106
	git cherry-pick --no-commit 4c770f836c916abe968901ff9f06bb611812cb4a

	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && _opts=('--enable-unit' '--enable-integration')
	./configure --prefix=/usr --enable-tctienvvar "${_opts[@]}"
	make
}

check() {
	cd "${pkgname%-git}"
	"$srcdir/tpm2-tss-engine-git_check.sh"
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

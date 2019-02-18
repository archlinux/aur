# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine-git
pkgver=r56.9b0c7d1
pkgrel=1
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'cmocka' 'pandoc')
checkdepends=('expect' 'ibm-sw-tpm2' 'tpm2-tools-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'tpm2-tss-engine-git_check.sh')
sha512sums=('SKIP'
            '77d0d1789376e76b1f357edea59e5cd0953cfcf33c35069da6c4092c43e028dfb1e1593e3c85456e590f9da8252701519a06a5eb94adf8501cf4e5f21cc92cf1')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"

	# Workaround for https://github.com/tpm2-software/tpm2-tss-engine/issues/79
	sed --in-place 's/#ifdef TSS22/#if 0/' src/tpm2-tss-engine-common.c

	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --enable-tctienvvar
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

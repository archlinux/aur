# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine-git
pkgver=r47.e008159
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
            'e6c9f852ec508d78817a091b2a63fe82457ee952d86e1b5325c75bf7c80a8fa42fd99d217e4ec55a5825e92faf29ff95b88f2e436530a94ad288f629a8f355a7')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	sed --in-place 's|@CODE_COVERAGE_RULES@|include $(top_srcdir)/aminclude_static.am|' Makefile.am
	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --enable-tctienvvar
	make
}

check() {
	cd "${pkgname%-git}"
	"$srcdir/tpm2-tss-engine-git_check.sh"
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

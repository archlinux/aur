# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tools-git
pkgver=3.0.2.r692.8f14189c
pkgrel=1
pkgdesc='TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('tpm2-tss>=2.0.0' 'curl')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka>=1.0.0' 'tpm2-abrmd>=2.0.0' 'ibm-sw-tpm2' 'python-yaml' 'vim')
optdepends=('tpm2-abrmd: user space resource manager to swap objects in and out of the limited TPM memory')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf '%s' "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --enable-unit
	dbus-run-session -- make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-totp-git
pkgver=r1.51c2aee
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using time-based one-time passwords'
arch=('x86_64')
url='https://github.com/AndreasFuchsSIT/tpm2-totp'
license=('BSD')
depends=('qrencode' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'oath-toolkit' 'pandoc')
checkdepends=('ibm-sw-tpm2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')
BUILDENV+=('!check') # see warning below before enabling tests

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}

# WARNING: currently tests are disabled by default because they use an available hardware TPM.
# This should generally be safe, but the tests might fail if your TPM does not support all
# cryptographic algorithms used by the test suite and some data might get left behind in the
# TPM's storage (NVRAM). Familiarise yourself with the documentation before enabling tests
# or build in a clean chroot that does not have access to the physical TPM device.
check() {
	cd "${pkgname%-git}"
	make --jobs=1 check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

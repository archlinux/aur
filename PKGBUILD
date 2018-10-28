# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-tss-engine-git
pkgver=r18.2cc72e5
pkgrel=1
pkgdesc='OpenSSL Engine for TPM2 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('tpm2-tss>=2.0.0' 'openssl')
makedepends=('git' 'autoconf-archive' 'pandoc')
#checkdepends=('ibm-sw-tpm2' 'tpm2-tools-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        "Terminate-ERR_STRING_DATA-arrays-correctly.patch::$url/pull/43.patch"
        'tpm2-tss-engine_make-check.sh')
sha512sums=('SKIP'
            '89b3f01523f4703504cd3740761e1cc417a72360cd89668073d7d28ea2cc4b3dc760fa701beef7c06def6ef50d52afc1325479f1152eff5be2134438118f67ff'
            '8388e9e80373c83cb3e12ad556eeb63086160372b2d2f602645ce7a98fc27fc891f56a72899608c7408b7b20d6eef88eb3cf1b1cd36c2c8b389e6b6da5461a89')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	patch -p1 -i "$srcdir/Terminate-ERR_STRING_DATA-arrays-correctly.patch"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

# WARNING: currently the tests use an available hardware TPM for some operations, see
# https://github.com/tpm2-software/tpm2-tss-engine#development-prefixes
# This will cause some tests to fail, so do not enable this function on systems with a TPM
# or build in a clean chroot that does not have access to the device.
#check() {
#	cd "${pkgname%-git}"
#	"$srcdir/tpm2-tss-engine_make-check.sh"
#}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

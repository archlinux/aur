# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tss-git
pkgver=2.3.0.rc0.r5.185659ca
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 Software Stack (TSS2)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('openssl')
makedepends=('git' 'autoconf-archive' 'doxygen')
checkdepends=('cmocka' # for unit test suite
              'ibm-sw-tpm2' 'iproute2' 'procps-ng' 'uthash') # for integration test suite
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && _opts=('--enable-unit' '--enable-integration')
	./configure --prefix=/usr --with-udevrulesprefix=60- "${_opts[@]}"
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install

	# Since upstream commit 1a4a8bc4d229c140086790e0bb9e2b290d865bd3, this file gets installed to
	# set the default TCTI. It is a symbolic link to libtss2-tcti-device.so, which means that the
	# TPM is accessed directly using /dev/tpm0. Distributions are supposed to configure their
	# preferred TCTI by symlinking the correct library to libtss2-tcti-default.so using something
	# like update-alternatives, see
	# https://github.com/tpm2-software/tpm2-tss/issues/1482#issuecomment-516363966
	# Since Arch Linux does not have such a mechanism, we remove the default configuration to use
	# the standard tpm2-tss TCTI detection logic: it tries to load the TCTI provided by tpm2-abrmd
	# first, falling back to the device TCTI if not available and then to the TPM simulator if even
	# that fails. This provides the expected user experience: if tpm2-abrmd is installed, use that,
	# otherwise fall back to the direct device access included in tpm2-tss.
	rm "$pkgdir/usr/lib/libtss2-tcti-default.so"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	echo 'u tss - "tss user for tpm2"' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

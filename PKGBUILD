# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tpm2-totp
pkgver=0.1.2
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using time-based one-time passwords'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-totp'
license=('BSD')
depends=('qrencode' 'tpm2-tss')
checkdepends=('ibm-sw-tpm2' 'oath-toolkit' 'psmisc' 'tpm2-tools')
optdepends=('mkinitcpio: hook to display the TOTP during boot')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        'initcpio_install_tpm2-totp'
        'initcpio_hooks_tpm2-totp')
sha512sums=('b0b881dffe83447f6900b515147072fdd162860e0f8dd1718627e9dffd1d3130240805feba274704f3aa9b4f3c758717ef301f1d35f36d3cb1c6dd7d69142325'
            'SKIP'
            '33738cb9d30d6ad338b6cf6bca538ba4f9b49b9ae799626efc7462bb2a31e386cd04d8298e8c2e3743f4c212866e864332869e4393871f22360edc2567fad163'
            'ebce4c738012dbcb82513b1f8148ee17deb088f80fa4f365d1b5f34b9c57f28b1995b4e6d04e003fd2ef6ed3393fb0c4496d182b02a7f5b2609b2ed4a160dac1')
validpgpkeys=('D6B4D8BAC7E0CC97DCD4AC7272E88B53F7A95D84'  # Andreas Fuchs
              'FE2E6249201CA54A4FB90D066E80CA1446879D04') # Jonas Witschel
BUILDENV+=('!check') # see warning below before enabling tests

build() {
	cd "$pkgname-$pkgver"
	(( CHECKFUNC )) && _opts=('--enable-integration')
	./configure --prefix=/usr "${_opts[@]}"
	make
}

# WARNING: currently tests are disabled by default because they use an available hardware TPM.
# This will overwrite any TOTP secrects previously stored there! It is recommended to build
# in a clean chroot that does not have access to the physical TPM device.
check() {
	cd "$pkgname-$pkgver"
	make --jobs=1 check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/initcpio_install_tpm2-totp" "$pkgdir/usr/lib/initcpio/install/tpm2-totp"
	install -Dm644 "$srcdir/initcpio_hooks_tpm2-totp" "$pkgdir/usr/lib/initcpio/hooks/tpm2-totp"
}

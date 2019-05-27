# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-totp
pkgver=0.1.1
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
sha512sums=('33a4af16a292ddd674a399bf12ce0b355d95de7014e8be11816a1d88edfd36ae222a8b7508f3aa1be3b46c7e04bf2712ee4839cf9f4f83fc308cb4f639ec5b9f'
            'SKIP'
            '33738cb9d30d6ad338b6cf6bca538ba4f9b49b9ae799626efc7462bb2a31e386cd04d8298e8c2e3743f4c212866e864332869e4393871f22360edc2567fad163'
            'ebce4c738012dbcb82513b1f8148ee17deb088f80fa4f365d1b5f34b9c57f28b1995b4e6d04e003fd2ef6ed3393fb0c4496d182b02a7f5b2609b2ed4a160dac1')
validpgpkeys=('D6B4D8BAC7E0CC97DCD4AC7272E88B53F7A95D84') # Andreas Fuchs
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

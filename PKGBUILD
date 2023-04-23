# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Luna Jernberg <droidbittin@gmail.com>
# Maintainer: Jonas Schwartz <jonas@josc.io>
# Maintainer: Vlad <ejiek at mail.ru>
# Maintainer: Solomon Choina<shlomochoina@gmail.com>
# Contributor: intrnl

_channel=dev
_pkgname=microsoft-edge-dev
pkgname=microsoft-edge-dev-bin
_pkgshortname=msedge-dev
pkgver=114.0.1793.0
pkgrel=1
_uprel=1
pkgdesc="A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier"
arch=(x86_64)
url="https://www.microsoftedgeinsider.com/en-us/download"
license=(custom)
provides=("microsoft-edge=$pkgver")
conflicts=(microsoft-edge)
depends=(gtk3 libcups nss alsa-lib libxtst libdrm mesa)
makedepends=(imagemagick)
optdepends=('gnome-keyring: for storing passwords in GNOME keyring'
            'gtk3: for printing'
            'kdialog: for file dialogs in KDE'
            'kwallet: for storing passwords in KWallet'
            'libpipewire02: WebRTC desktop sharing under Wayland'
            'libunity: for download progress on KDE'
            'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
            'xdg-utils')
options=(!strip !zipman)
source=("https://packages.microsoft.com/repos/edge/pool/main/m/$_pkgname/${_pkgname}_$pkgver-${_uprel}_amd64.deb"
        "$_pkgname.sh"
        "Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf")
sha256sums=('e16744fbc96dbf0ed6d4898788bbff301474d8ae93f48d27a8334c93a3e3df4c'
            '285afe53b2cd617ae7f4930a1d0befe12a97ae31c30cfad74e97bf695c6f6a8a'
            'edf2ed596eb068f168287fc76aa713ad5e0afb59f0a0a47a4f29c0c124ade15e')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# suid sandbox
	chmod 4755 "$pkgdir/opt/microsoft/$_pkgshortname/msedge-sandbox"

	# 256 and 24 are proper colored icons
	for res in 128 64 48 32; do
		convert "$pkgdir/opt/microsoft/$_pkgshortname/product_logo_256_dev.png" \
			-resize "${res}x${res}" \
			"$pkgdir/opt/microsoft/$_pkgshortname/product_logo_${res}_dev.png"
	done
	for res in 22 16; do
		convert "$pkgdir/opt/microsoft/$_pkgshortname/product_logo_24_dev.png" \
			-resize "${res}x${res}" \
			"$pkgdir/opt/microsoft/$_pkgshortname/product_logo_${res}_dev.png"
	done

	# copy icons where FHS expects them
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/microsoft/$_pkgshortname/product_logo_${res}_dev.png" \
			"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$_pkgname.png"
	done

	# User flag aware launcher
	install -Dm0755 microsoft-edge-dev.sh "$pkgdir/usr/bin/$_pkgname"

	install -Dm0644 'Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
	rm -r "$pkgdir/etc/cron.daily/" "$pkgdir/opt/microsoft/$_pkgshortname/cron/"
	rm "$pkgdir/opt/microsoft/$_pkgshortname/"product_logo_*.png
}


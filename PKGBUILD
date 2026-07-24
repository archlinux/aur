# Maintainer: Luna Jernberg <droidbittin@gmail.com>


_channel=canary
_pkgname=microsoft-edge-canary
pkgname=microsoft-edge-canary-bin
_pkgshortname=msedge-canary
pkgver=152.0.4173.0
pkgrel=1
_uprel=1
pkgdesc="A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier"
arch=(x86_64)
url="https://www.microsoftedgeinsider.com/en-us/download"
license=(custom)
provides=("microsoft-edge=$pkgver")
conflicts=(microsoft-edge)
depends=(gtk3 libcups nss alsa-lib libxtst libdrm mesa libxml2-legacy)
makedepends=(imagemagick)
optdepends=('gnome-keyring: for storing passwords in GNOME keyring'
            'gtk3: for printing'
            'kdialog: for file dialogs in KDE'
            'kwallet: for storing passwords in KWallet'
            'libpipewire: WebRTC desktop sharing under Wayland'
            'libunity: for download progress on KDE'
            'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
            'xdg-utils')
options=(!strip !zipman)
source=("https://packages.microsoft.com/repos/edge/pool/main/m/$_pkgname/${_pkgname}_$pkgver-${_uprel}_amd64.deb"
        "$_pkgname.sh"
        "Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf")
sha256sums=('11fa47483faaec7508401975aaafcbb7dc139ab2aacc061be8f56d662a151e3e'
            '94d18bb414adb7693c4234ce5d0eac1e04caf98dc197ff8247ac5e84ea42f2d1'
            'edf2ed596eb068f168287fc76aa713ad5e0afb59f0a0a47a4f29c0c124ade15e')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# suid sandbox
	chmod 4755 "$pkgdir/opt/microsoft/$_pkgshortname/msedge-sandbox"

	# 256 and 24 are proper colored icons
	for res in 128 64 48 32; do
		magick "$pkgdir/opt/microsoft/$_pkgshortname/product_logo_256_canary.png" \
			-resize "${res}x${res}" \
			"$pkgdir/opt/microsoft/$_pkgshortname/product_logo_${res}_canary.png"
	done
	for res in 22 16; do
		magick "$pkgdir/opt/microsoft/$_pkgshortname/product_logo_24_canary.png" \
			-resize "${res}x${res}" \
			"$pkgdir/opt/microsoft/$_pkgshortname/product_logo_${res}_canary.png"
	done

	# copy icons where FHS expects them
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/microsoft/$_pkgshortname/product_logo_${res}_canary.png" \
			"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$_pkgname.png"
	done

	# User flag aware launcher
	install -Dm0755 microsoft-edge-canary.sh "$pkgdir/usr/bin/$_pkgname"

	install -Dm0644 'Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
	rm -r "$pkgdir/etc/cron.daily/" "$pkgdir/opt/microsoft/$_pkgshortname/cron/"
	rm "$pkgdir/opt/microsoft/$_pkgshortname/"product_logo_*.png
}



# Maintainer: Solomon Choina<shlomochoina@gmail.com>
pkgname=microsoft-edge-dev
_pkgname=msedge-dev
pkgver=88.0.673.0
pkgrel=1
pkgdesc="Microsoft Edge is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier"
arch=('x86_64')
url="https://www.microsoftedgeinsider.com/en-us/download"
license=('Microsoft Edge License')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'mesa')
makedepends=('w3m' 'imagemagick')
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland'
	'kdialog: for file dialogs in KDE'
	'gnome-keyring: for storing passwords in GNOME keyring'
	'kwallet: for storing passwords in KWallet'
	'gtk3-print-backends: for printing'
	'libunity: for download progress on KDE'
	'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
	'xdg-utils')
options=(!strip !zipman)
_channel=dev
source=("https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/${pkgname}_${pkgver}-1_amd64.deb"
		"Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf")
sha256sums=('ffd002c232bfb54f23648bd56e4bec60c74eae35c19f1e45c15e84a2a114d3e1'
            'edf2ed596eb068f168287fc76aa713ad5e0afb59f0a0a47a4f29c0c124ade15e')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"

 # suid sandbox
  chmod 4755 "$pkgdir/opt/microsoft/$_pkgname/msedge-sandbox"

 # 256 and 24 are proper colored icons
    for res in 128 64 48 32; do
        convert "$pkgdir/opt/microsoft/$_pkgname/product_logo_256_dev.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/microsoft/$_pkgname/product_logo_{$res}_dev.png"
    done
    for res in 22 16; do
        convert "$pkgdir/opt/microsoft/$_pkgname/product_logo_24_dev.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/microsoft/$_pkgname/product_logo_${res}_dev.png"
    done

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/microsoft/$_pkgname/product_logo_${res}_dev.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
    done

	# License
	install -Dm644 'Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf' "$pkgdir"/usr/share/licenses/$pkgname/'Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf'
	msg2 "Removing Debian Cron job and duplicate product logos..."
	rm -r "$pkgdir"/etc/cron.daily/ "$pkgdir"/opt/microsoft/$_pkgname/cron/
	rm "$pkgdir"/opt/microsoft/$_pkgname/product_logo_*.png
}


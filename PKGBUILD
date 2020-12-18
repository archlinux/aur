# Maintainer: Solomon Choina<shlomochoina@gmail.com>
# Contributor: Vlad <ejiek at mail.ru>
# Contributor: intrnl

pkgname=microsoft-edge-dev-bin
_pkgname=microsoft-edge-dev
_pkgshortname=msedge-dev
pkgver=89.0.731.0
pkgrel=1
pkgdesc="A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier"
arch=('x86_64')
url="https://www.microsoftedgeinsider.com/en-us/download"
license=('custom')
provides=('microsoft-edge-dev' 'edge-dev')
conflicts=('microsoft-edge-dev' 'edge-dev' 'edge-dev-bin' 'edge')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'mesa')
makedepends=('imagemagick')
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
source=("https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/${_pkgname}_${pkgver}-1_amd64.deb"
        "microsoft-edge-dev.sh"
        "Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf")
sha256sums=('b1d64e9a837b021137db7f4a84e307f2f79b6b0d09cf26c40877a5a5d3066f86'
            '285afe53b2cd617ae7f4930a1d0befe12a97ae31c30cfad74e97bf695c6f6a8a'
            'edf2ed596eb068f168287fc76aa713ad5e0afb59f0a0a47a4f29c0c124ade15e')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# suid sandbox
	chmod 4755 "${pkgdir}/opt/microsoft/${_pkgshortname}/msedge-sandbox"

	# 256 and 24 are proper colored icons
	for res in 128 64 48 32; do
		convert "${pkgdir}/opt/microsoft/${_pkgshortname}/product_logo_256_dev.png" \
			-resize ${res}x${res} \
			"${pkgdir}/opt/microsoft/${_pkgshortname}/product_logo_${res}_dev.png"
	done
	for res in 22 16; do
		convert "${pkgdir}/opt/microsoft/${_pkgshortname}/product_logo_24_dev.png" \
			-resize ${res}x${res} \
			"${pkgdir}/opt/microsoft/${_pkgshortname}/product_logo_${res}_dev.png"
	done

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/opt/microsoft/${_pkgshortname}/product_logo_${res}_dev.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
	done

	# User flag aware launcher
	install -m755 microsoft-edge-dev.sh "${pkgdir}/usr/bin/microsoft-edge-dev"

	# License
	install -Dm644 'Microsoft Standard Application License Terms - Standalone (free) Use Terms.pdf' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.pdf"
	rm -r "${pkgdir}/etc/cron.daily/" "${pkgdir}/opt/microsoft/${_pkgshortname}/cron/"
	# Globbing seems not to work inside double parenthesis
	rm "${pkgdir}/opt/microsoft/${_pkgshortname}"/product_logo_*.png
}


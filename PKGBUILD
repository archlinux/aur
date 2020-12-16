# Maintainer: Kevin Wilms <niemandausduisburg@gmx.net>

pkgname=videobrowser
pkgver=2.0
_srcname=microsoft-edge-dev
_pkgshortname=msedge-dev
_srcpkgver=89.0.723.0
pkgrel=2
pkgdesc="Browser with shortcuts for Videoplatforms. Based on Microsoft Edge Dev. New Shortcuts can i make just in time."
arch=('x86_64')
url="https://www.microsoftedgeinsider.com/en-us/download"
license=('custom')
provides=()
conflicts=()
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
source=("https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/${_srcname}_${_srcpkgver}-1_amd64.deb"
        "videobrowser.sh"
        "Netflix.png"
        "netflix.desktop"
        "youtube.desktop"
        "YouTube.png"
        "Twitch.png"
        "twitch.desktop"
        "amazon-prime.png"
        "amazon-prime.desktop"
        "dailymotion.desktop"
        "Dailymotion.png"
        "Disney.png"
        "disney+.desktop"
        "TVNOW.png"
        "tvnow.desktop")
sha256sums=('9335faa09bfb9712bfe4d9575bc6d786533fcec8a740fc2a88839e86e6fe8537'
            '3516070a2bcfa8d28989975813a32a4b197d30aa629ea20632a1fc5b2b83aa20'
            '0d15536c32f31a6625609df76de33b9429c12cb970b6cda4db1044b6d9c272e9'
            'dbfdb72600e77f07b07d3d8d5ba08f7ee73825e4775b6e2d02a8f8d0ab0b381e'
            'e0860d58f7676b88244a232ca7d4aa9e5c9180017b665d0d6b54b066f3a62ed3'
            'c42f9d3d58eafd4b95044ef818ee0c32b5120d57f4212f0cdd9ec878a477a2b9'
            'ec1008447123d58511bd4738d5adc022aa7090f14d2776eb6a487c9a0a7e9855'
            '717bde96aba89d6a01ff6ce92e2e16c91a1b4646e07d0f1998442e9aa060fe93'
            '0956633217210e9caa64c9f5f1d85e8d582035df89d4649120c3467b316e3523'
            'b1a9bb378534037dc0044a192e762edce0079984c5567baa38128fb1bb26ed0e'
            '8442070b5319bd6fe8c5d728d9da0c77a5ea525598a3a0a4bfe4bbf04a784cfa'
            'de111a8f88b7eaf3e5a77c58389f14a8fb6154538af4b7108e8c8d7d79c5d48f'
            'ff195b31468fd0d8ce7cb3824ff26bd114eb6720ba12e69205b1cb592f5c32b1'
            '9341f66c5a7a6e004fc40c83429ce55ebb343abecfbb15c689a7fcdc64837fb4'
            '47b25cc0e9222eae5e89532edb1fdb28b18a0d2103661946239e7346334d9711'
            '38bbbcdd3ad56c8a927dbe63a04cc1f3e1dde8a41b01acb0824f49a828e2d912')

package() {
	echo "Extracting Microsoft Edge"
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	mkdir "$pkgdir/opt/videobrowser"
	cp -r "$pkgdir/opt/microsoft" "$pkgdir/opt/videobrowser/microsoft"
	rm -rf "$pkgdir/opt/microsoft"

	# suid sandbox
	chmod 4755 "${pkgdir}/opt/videobrowser/microsoft/${_pkgshortname}/msedge-sandbox"
	
	echo "Create Icons for Shortcuts"
	# create Icons for Apps
	for _size in "256x256" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/Netflix.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/Netflix.png"
    convert "${srcdir}/YouTube.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/Youtube.png"
    convert "${srcdir}/Twitch.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/Twitch.png"
    convert "${srcdir}/amazon-prime.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/amazon-prime.png"
    convert "${srcdir}/Dailymotion.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/Dailymotion.png"
    convert "${srcdir}/Disney.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/Disney.png"
    convert "${srcdir}/TVNOW.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/TVNOW.png"
  done

	echo "Install Videobrowser"
	# User flag aware launcher
	install -m755 videobrowser.sh "${pkgdir}/usr/bin/videobrowser"

	echo "Install Shortcuts"
	# Install Shortcuts
	install -Dm644 "${srcdir}/netflix.desktop" "${pkgdir}/usr/share/applications/netflix.desktop"
	install -Dm644 "${srcdir}/youtube.desktop" "${pkgdir}/usr/share/applications/youtube.desktop"
	install -Dm644 "${srcdir}/twitch.desktop" "${pkgdir}/usr/share/applications/twitch.desktop"
	install -Dm644 "${srcdir}/amazon-prime.desktop" "${pkgdir}/usr/share/applications/amazon-prime.desktop"
	install -Dm644 "${srcdir}/dailymotion.desktop" "${pkgdir}/usr/share/applications/dailymotion.desktop"
	install -Dm644 "${srcdir}/disney+.desktop" "${pkgdir}/usr/share/applications/disney+.desktop"
	install -Dm644 "${srcdir}/tvnow.desktop" "${pkgdir}/usr/share/applications/tvnow.desktop"
	
	echo "Cleanup"
	# Cleanup
	rm -rf "${pkgdir}/usr/bin/microsoft-edge-dev"
	rm -rf "${pkgdir}/usr/share/applications/microsoft-edge-dev.desktop"
	rm -rf "${pkgdir}/usr/share/appdata"
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/gnome-control-center"
	rm -rf "${pkgdir}/usr/share/man"
	rm -rf "${pkgdir}/usr/share/menu"
}

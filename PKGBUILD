# Copyright (c) 2022 Alex313031, JPratama7, and StarterX4.
# Maintainer: JPratama7 <josepratama080@gmail.com>
# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname=thorium-browser
pkgname=${_pkgname}-bin
pkgver=113.0.5672.134
pkgrel=1
pkgdesc="Chromium fork focused on high performance and security."
arch=('x86_64')
url="https://github.com/Alex313031/Thorium"
license=('GPLv3')
depends=(
	'alsa-lib'
	'gtk3'
	'libcups'
	'libxss'
	'libxtst'
	'nss'
	'ttf-liberation'
	'xdg-utils'
)
optdepends=(
	'pipewire: WebRTC desktop sharing under Wayland'
	'kdialog: for file dialogs in KDE'
	'gnome-keyring: for storing passwords in GNOME keyring'
	'kwallet: for storing passwords in KWallet'
)
options=('!emptydirs' '!strip')
install=$_pkgname.install
source=("https://github.com/Alex313031/Thorium/releases/download/M${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb"
	"$_pkgname.sh")
sha512sums=('0e0a17026a072b4e85f057e14c30381f26f2a6a83dd69a29963c6196dd9ef89b704e6dc348b2d0c802323be4ec845d7675d852b6dc6ee833c977606ca80304a0'
            '91a532fde9e6e87d65b909a170d32808f1c05367104cdaab07043fef0de66bdfc307a4138584cd1eedc169a03207372df39c09268ab1ec741432e79e0dcc2dfb')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	echo "  -> Moving stuff in place..."
	# Launcher
	install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

	chmod 4755 "$pkgdir/opt/chromium.org/thorium/chrome-sandbox"
	
	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/chromium.org/thorium/product_logo_${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/thorium-browser.png
	done
	install -Dm644 "$pkgdir/opt/chromium.org/thorium/thorium_shell.png" -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"

	echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/chromium.org/thorium/cron/ \
		"$pkgdir"/opt/chromium.org/thorium/product_logo_*.{png,xpm} \
		"$pkgdir"/usr/share/menu/
}

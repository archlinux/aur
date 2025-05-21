pkgname=chromium-clang-avx-bin
pkgver=138.0.7189.0
pkgrel=1
pkgdesc="Chromium browser compiled with the Clang/LLVM compiler."
arch=('x86_64')
url="https://github.com/RobRich999/Chromium_Clang"
license=('custom:chrome')
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
install=chromium-clang.install
_channel=unstable
_tag=1462098
_avx=avx
source=("https://github.com/RobRich999/Chromium_Clang/releases/download/v${pkgver}-r${_tag}-linux64-deb-${_avx}/chromium-browser-${_channel}_${pkgver}-1_amd64.deb"
	"chromium-browser-$_channel.sh")
sha512sums=('6a955a10c1e0e1d716c24f75f1dac6cfdcf2f243fb6d99f573fd87d41fb451ce60a247fd49ab9497e710574477d40848ebec13ecf2366341526a44514008264f'
            '478d382d96aca0c7d139282e8f4e9ab855e004f8cd9b15243c226b28282eb825e0bba5eb18cb17aea06e5637ece75d40d63fa9fee291f8b1528518975c0de095')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# Launcher
	install -m755 chromium-browser-$_channel.sh "$pkgdir"/usr/bin/chromium-browser-$_channel

	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/chromium.org/chromium-unstable/product_logo_${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/chromium-browser-unstable.png
	done

	# Fix the Chrome desktop entry
	sed -i \
		-e "/Exec=/i\StartupWMClass=Chromium-browser" \
		"$pkgdir"/usr/share/applications/chromium-browser-unstable.desktop

	# Remove the Debian Cron job, duplicate product logos and menu directory
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/chromium.org/chromium-unstable/cron/ \
		"$pkgdir"/opt/chromium.org/chromium-unstable/product_logo_*.{png,xpm} \
		"$pkgdir"/usr/share/menu/

	# Remove Desktop
	rm -r "$pkgdir"/usr/share/applications/org.chromium.Chromium.unstable.desktop
}

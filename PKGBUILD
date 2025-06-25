pkgname=chromium-clang-avx2-bin
pkgver=139.0.7226.0
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
_tag=1470985
_avx=avx2
source=("https://github.com/RobRich999/Chromium_Clang/releases/download/v${pkgver}-r${_tag}-linux64-deb-${_avx}/chromium-browser-${_channel}_${pkgver}-1_amd64.deb"
	"chromium-browser-$_channel.sh")
sha256sums=('78bbcbb9552eff635559a0ee5b57b69a0780c90b7d57121ad6c3dca01e14f315'
            '9AAC2B59BA2BA8CA0259A8F9D12AB49EB0B431F434888C046EE4A4293A5C1B6B')

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

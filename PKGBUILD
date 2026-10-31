# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario

# Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Dev%20updates
# or use: $ curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep -A1 "Package: google-chrome-unstable" | awk '/Version/{print $2}' | cut -d '-' -f1

pkgname=google-chrome-dev
pkgver=159.0.8130.0
pkgrel=1
pkgdesc="The popular web browser by Google (Dev Channel)"
arch=(
    'x86_64'
    'aarch64'
)
url="https://www.google.com/chrome"
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
	'kwallet5: for storing passwords in KWallet'
)
provides=('google-chrome')
options=('!emptydirs' '!strip')
install=$pkgname.install
_channel=unstable
source=(
    'eula_text.html'
    "google-chrome-$_channel.sh"
)
sha512sums=('a225555c06b7c32f9f2657004558e3f996c981481dbb0d3cd79b1d59fa3f05d591af88399422d3ab29d9446c103e98d567aeafe061d9550817ab6e7eb0498396'
            '445eb36a588f49af018ded3d852b63e0523ffac20c25be721f3ef4663591256849432bebb3d9f352e4f53cbe1fb77fa67cf8911c9161f826490a21adbdcc81f4')
sha512sums_x86_64=('9e7f12aa4ad4d033d7c21b30afb9b7366f1908a361c6ca213eea2811e628d30edb2c815f2f020ffe98f1c301bb070dcf05edce964f5285f624c7425ab294ece6')
sha512sums_aarch64=('916331fb0583c8888bd735288bee7ea7ac0735ddb1e84836ad2c4cd9219080efab906c1a9df1aa09e2928a5fbb0fbf6ecac69f6293369c64e094017ac6007b53')

source_x86_64=("https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-${_channel}/google-chrome-${_channel}_${pkgver}-1_amd64.deb")
source_aarch64=("https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-${_channel}/google-chrome-${_channel}_${pkgver}-1_arm64.deb")

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# Launcher
	install -m755 google-chrome-$_channel.sh "$pkgdir"/usr/bin/google-chrome-$_channel

	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/google/chrome-$_channel/product_logo_${i/x*/}_${pkgname/*-/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/google-chrome-$_channel.png
	done

	# License
	install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/google-chrome-$_channel/eula_text.html
	install -Dm644 "$pkgdir"/opt/google/chrome-$_channel/WidevineCdm/LICENSE \
		"$pkgdir"/usr/share/licenses/google-chrome-$_channel/WidevineCdm-LICENSE.txt

	# Fix the Chrome desktop entry
	sed -i \
		-e "/Exec=/i\StartupWMClass=Google-chrome-$_channel" \
		-e "s/x-scheme-handler\/ftp;\?//g" \
		"$pkgdir"/usr/share/applications/google-chrome-$_channel.desktop

	# Remove the Debian Cron job, duplicate product logos and menu directory
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/google/chrome-$_channel/cron/ \
		"$pkgdir"/opt/google/chrome-$_channel/product_logo_*.png
}

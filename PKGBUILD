# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario

# Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Dev%20updates
# or use: $ curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep -A1 "Package: google-chrome-unstable" | awk '/Version/{print $2}' | cut -d '-' -f1

pkgname=google-chrome-dev
pkgver=154.0.8025.0
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
sha512sums_x86_64=('09820e8888050128c4bf45468e075d1b469853adc2a10101b783c87304fa0d9f57c6df5ad85c6435baaec4b12cc21e2f86c30cb7c5200c549794f459a3aa12cf')
sha512sums_aarch64=('54ed1d23125690ac53015fb6be46099cdf29bf7febdae07643129876336190c40d427565f372df4b6b454cf4ea96d177dcd2cb1c5d8fa60e89c3e8f2c7d3f16f')

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

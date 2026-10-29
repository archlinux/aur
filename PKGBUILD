# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario, Abdullah

# Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Stable%20updates
# or use: $ curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep -A1 "Package: google-chrome-stable" | awk '/Version/{print $2}' | cut -d '-' -f1

pkgname=google-chrome
pkgver=156.0.8078.79
pkgrel=1
pkgdesc="The popular web browser by Google (Stable Channel)"
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
	'kwallet: for storing passwords in KWallet'
)
options=('!emptydirs' '!strip')
install=$pkgname.install
_channel=stable
source=('eula_text.html'
        "google-chrome-$_channel.sh")
sha512sums=('a225555c06b7c32f9f2657004558e3f996c981481dbb0d3cd79b1d59fa3f05d591af88399422d3ab29d9446c103e98d567aeafe061d9550817ab6e7eb0498396'
            'de02b498a4b5b93e21622c8dba57befe795d733a04656be911cc38e28bfef0e20470450f44be523bbde8d4de28f79c10434846ca01fc2a2f4e67707b79332f94')
sha512sums_x86_64=('68ea17afbc84d788ed9e1b6c2c16e979a5e5773b1ae6b6b30e4485d0c39547d7f3a74f028bc5e134cc1412c8534cfdf31b4f85e9f3016fc8b70430d768324315')
sha512sums_aarch64=('6510cdee61b3ee83c352c460ceb47fedc4caae638dbb380c523d57ea396e02174ffa5073f1932f4108f8416b62482c4759f993e8ccddf3a268737729b8c00d16')

source_x86_64=("https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-${_channel}/google-chrome-${_channel}_${pkgver}-1_amd64.deb")
source_aarch64=("https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-${_channel}/google-chrome-${_channel}_${pkgver}-1_arm64.deb")

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# Launcher
	install -m755 google-chrome-$_channel.sh "$pkgdir"/usr/bin/google-chrome-$_channel

	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/google/chrome/product_logo_${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/google-chrome.png
	done

	# License
	install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/google-chrome/eula_text.html
	install -Dm644 "$pkgdir"/opt/google/chrome/WidevineCdm/LICENSE \
		"$pkgdir"/usr/share/licenses/google-chrome-$_channel/WidevineCdm-LICENSE.txt

	# Fix the Chrome desktop entry
	sed -i \
		-e "/Exec=/i\StartupWMClass=Google-chrome" \
		-e "s/x-scheme-handler\/ftp;\?//g" \
		"$pkgdir"/usr/share/applications/google-chrome.desktop

	# Remove the Debian Cron job, duplicate product logos and menu directory
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/google/chrome/cron/ \
		"$pkgdir"/opt/google/chrome/product_logo_*.png
}

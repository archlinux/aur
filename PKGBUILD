# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario, Abdullah

# Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Stable%20updates
# or use: $ curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep -A1 "Package: google-chrome-stable" | awk '/Version/{print $2}' | cut -d '-' -f1

pkgname=google-chrome
pkgver=152.0.7977.64
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
sha512sums_x86_64=('8401cc4a4f11714bcef72c6139d53dc2ff68f97257339f34bc8c117f55c72bdacb47b8c2feb38ef79c4d5747f76fecd1a3dfe154e8d67fa247f842e9a2718eeb')
sha512sums_aarch64=('c47e78be540368a86521f4a5c64471b9c914af9c624f653d518d4efa0557438735b7e037b2e451e86a7c14e2feca7efc514a450a94653233edbf6afdd693f6da')

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

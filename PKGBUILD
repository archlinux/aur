# Maintainer: onurmercury <onurmercury at proton dot me>
# Contributor: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario


# The Chromium built with the Clang and LLD, more details can be found at:
# https://github.com/RobRich999/Chromium_Clang
#
# Check for new releases (Linux & Windows, AVX & AVX2) at:
# https://github.com/RobRich999/Chromium_Clang/releases
#
# or use this (for Linux AVX):
# $ curl -sf https://api.github.com/repos/RobRich999/Chromium_Clang/releases | grep -Em1 '.*\"name\"\:\ \"v.*-linux64-deb-avx\",' 2>/dev/null | awk '{print substr($0, 14, length($0) - 15)}'
#
# or use this (for Linux AVX2):
# $ curl -sf https://api.github.com/repos/RobRich999/Chromium_Clang/releases | grep -Em1 '.*\"name\"\:\ \"v.*-linux64-deb-avx2\",' 2>/dev/null | awk '{print substr($0, 14, length($0) - 15)}'
#
# Based on aur/google-chrome-dev


_debname=chromium-browser-unstable
_pkgname=chromium-unstable
_pkgver=v117.0.5924.0-r1177813-linux64-deb-avx

pkgname=chromium-unstable-bin
pkgver=117.0.5924.0
pkgrel=1
pkgdesc="The Chromium web browser for Linux built with the open source Clang compiler and LLD linker. (Unstable Channel)"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
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
provides=('chromium-browser-unstable')
conflicts=('chromium-unstable' 'chromium-unstable-avx2' 'chromium-unstable-avx2-bin')
options=('!emptydirs' '!strip')
install=$_debname.install
source=("https://github.com/RobRich999/Chromium_Clang/releases/download/${_pkgver}/${_debname}_${pkgver}-1_amd64.deb"
	    "$_debname.sh")
sha512sums=('e8dc89d9ed793a7b0322474f657044b9ce00bfb9cd81ac9842e0d0af95ed2a7b3f3064b7acd179e8c3deaec16b76819259ab033013f7ccfc74c0d92fa037ab4c'
            'deb0789f1a99fc5913041e3bc41e6999d597e2821e98345965c9899da7b56adb4e73c93167bcd38f49fc28fbaf2217d8a845dc1dc1e3f79d80bcccbcdbcddcf6')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# Launcher
	install -m755 $_debname.sh "$pkgdir"/usr/bin/$_debname

	# Icons
	for i in 16 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir"/opt/chromium.org/$_pkgname/product_logo_${i}.png \
			"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_debname.png
	done

	# Fix the Chromium desktop entry
	sed -i \
		-e "/Exec=/i\StartupWMClass=${_pkgname^}" \
		"$pkgdir"/usr/share/applications/$_debname.desktop

	# Remove the Debian Cron job, duplicate product logos and menu directory
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/chromium.org/$_pkgname/cron/ \
		"$pkgdir"/opt/chromium.org/$_pkgname/product_logo_*.{png,xpm} \
		"$pkgdir"/usr/share/menu/
}

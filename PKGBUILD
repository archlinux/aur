# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname=thorium-browser
pkgname=${_pkgname}-bin
pkgver=106.0.5212.0
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
source=("https://dl.thorium.rocks/debian/dists/stable/main/binary-amd64/${_pkgname}_${pkgver}-1_amd64.deb"
	"$_pkgname.sh")
sha512sums=('21e94067cd91cc4e9d1405f57f44c192d334cf2694de974bc7eaefd3673c0e6f1f26b110018d1e0b3f06934b55932fcf66bbecdbc15bd48921ca290bde67634e'
            '5e34cfbd67d86b31292a61eb5dcee68aeb2c4818bb557fa9aee458215eef8042c57be43b2250f5d89a66df90e4df6473a85688aa63ba2255e789d0f37ed83d8b')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	echo "  -> Moving stuff in place..."
	# Launcher
	install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/chromium.org/thorium/product_logo_${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/thorium-browser-unstable.png
	done

	echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/chromium.org/thorium/cron/ \
		"$pkgdir"/opt/chromium.org/thorium/product_logo_*.{png,xpm} \
		"$pkgdir"/usr/share/menu/
}

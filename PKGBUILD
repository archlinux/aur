# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=sway-config-fedora
pkgver=0.4.3
pkgrel=1
pkgdesc="Sway configuration from Fedora Sway Spin, opinionated with QoL improvements"
arch=('any')
url='https://gitlab.com/fedora/sigs/sway/sway-config-fedora'
license=('MIT')
depends=('sway' 'swaybg' 'swaylock' 'swayidle' 'waybar' 'bash' 'python')
optdepends=(
	'rofi-wayland: default app launcher'
	'foot: default terminal'
	'libnotify: for sending notifications'
	'libpulse: volume keys'
	'playerctl: media keys'
	'brightnessctl: screen brightness keys'
	'grimshot: screenshot key'
	'xdg-user-dirs: invoked by default config'
	'lxqt-policykit: autostart polkit agent'
)
backup=(
	'etc/sway/config-fedora'
	'etc/sway/environment'
)
install='sway-config-fedora.install'
source=(
	"https://gitlab.com/fedora/sigs/sway/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2"
	'0001-ARCH-deconflict-with-stock-config.patch'
	'0002-ARCH-remove-various-Fedora-isms.patch'
	'0003-Avoid-brightnessctl-percentage.patch'
)
sha256sums=('bf2552d2e635ade5fa36e2dfca8ba60853341c8d5fc3e1fa63c5c950b4c8eb83'
            '549b9522747f728c11e756a8ab9129dd3ac82ea368eb59660224b794d9e2a9ee'
            'f65e1d855b5a07cd16d8376b96d4b751a9bed0103d6784033ece1ef58823f251'
            'ca7bb05f806e15e26a88ccd277f52640c0e8470441841860e6e4f2a70b692509')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-ARCH-deconflict-with-stock-config.patch"
	patch -p1 -i "$srcdir/0002-ARCH-remove-various-Fedora-isms.patch"
	patch -p1 -i "$srcdir/0003-Avoid-brightnessctl-percentage.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make LIBEXECDIR='/usr/lib' BACKGROUND='/usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png'
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" LIBEXECDIR='/usr/lib' install-sway
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

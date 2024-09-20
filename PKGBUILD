# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=sway-config-fedora
pkgver=0.4.2
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
)
sha256sums=('fe7a142cf3db8a0a096a0b51aabc11fc4a57c3ea8ef8f67e2b18d678bcab57e1'
            '549b9522747f728c11e756a8ab9129dd3ac82ea368eb59660224b794d9e2a9ee'
            'b22fb5b6235eb23f80f768cce1425440ed2027285d4c9c1b166f30814f81faf0')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-ARCH-deconflict-with-stock-config.patch"
	patch -p1 -i "$srcdir/0002-ARCH-remove-various-Fedora-isms.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make LIBEXECDIR='/usr/lib'
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

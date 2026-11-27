# Builds swaygx from the latest commit pushed to GitHub (main).
# Usage:  makepkg -si

pkgname=swaygx-git
pkgver=0.6.1.r7.g7ebcee14
pkgrel=1
pkgdesc='Sway, but with eye candy (swayfx fork)'
arch=('x86_64' 'aarch64')
url='https://github.com/7r1n1t3/swaygx'
license=('MIT')
depends=(
	'cairo'
	'gdk-pixbuf2'
	'json-c'
	'libdrm'
	'libevdev'
	'libinput'
	'libxcb'
	'libxkbcommon'
	'pango'
	'pcre2'
	'pixman'
	'scenefx'
	'systemd-libs'
	'ttf-font'
	'wayland'
	'wlroots0.20'
	'xcb-util-wm'
)
makedepends=(
	'git'
	'meson'
	'scdoc'
	'wayland-protocols'
)
optdepends=(
	'swaybg: wallpaper'
	'swayidle: idle management'
	'swaylock: screen locker'
	'foot: default terminal'
	'wmenu: default application launcher'
	'xorg-xwayland: X11 application support'
	'xdg-desktop-portal-wlr: screen sharing'
)
provides=('sway' 'swayfx' 'wayland-compositor')
conflicts=('sway' 'sway-git' 'swayfx' 'swayfx-git')
backup=('etc/sway/config')
source=("swaygx::git+https://github.com/7r1n1t3/swaygx.git")
sha256sums=('SKIP')

pkgver() {
	cd swaygx
	git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson swaygx build \
		-D sd-bus-provider=libsystemd \
		-D werror=false \
		-D b_ndebug=true
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 swaygx/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

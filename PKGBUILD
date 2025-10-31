# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
 

pkgname=vivarium-git
_pkg="${pkgname%-git}"
pkgver=0.0.4.r30.g1ffa436
pkgrel=3
pkgdesc="A dynamic tiling Wayland compositor inspired by xmonad"
arch=('x86_64')
url="https://github.com/inclement/vivarium"
license=('GPL3')
depends=('wlroots0.15' 'xcb-util-renderutil' 'xorg-xwayland')
makedepends=('git' 'meson' 'wayland-protocols' 'cpptoml')
optdepends=('xorg-xwayland: X.org support under Wayland'
            'waybar: Bar program for Wayland; the only tested one')
provides=("$_pkg")
conflicts=("$_pkg")
backup=("etc/$_pkg/config.toml")
install="$pkgname.install"
source=("$_pkg::git+$url"
	"vivarium.desktop")
md5sums=('SKIP'
         '5e55dab3aaf5a50d29309c59b08eb143')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	meson --prefix=/usr --buildtype=release -Ddevelop=false -Dwerror=false "$_pkg" build
	meson compile -C build
	PKG_CONFIG_PATH='/usr/lib/wlroots0.15/pkgconfig'
}

# check() {
# 	meson test -C build
# }

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 ${_pkg}.desktop -t "$pkgdir/usr/share/wayland-sessions/"
}

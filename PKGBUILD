# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Carson Rueter <swurl at swurl dot xyz>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maxim Baz <rofi at maximbaz dot com>
# Contributor: Anatol Pomozov
# Contributor: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)
pkgname=rofi-lbonn-wayland
pkgver=1.7.5+wayland3
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement - fork with wayland support'
arch=(x86_64)
url="https://github.com/lbonn/rofi"
license=(MIT)
depends=(cairo
         gdk-pixbuf2
         glib2
         glibc
         hicolor-icon-theme
         libxcb
         libxkbcommon
         libxkbcommon-x11
         pango
         startup-notification
         wayland
         xcb-util
         xcb-util-cursor
         xcb-util-wm)
makedepends=('meson' 'wayland-protocols')
checkdepends=(check)
provides=(rofi)
conflicts=(rofi)
source=("$url/releases/download/$pkgver/${pkgname%-lbonn-wayland}-$pkgver.tar.gz")
sha256sums=('ddd66ce401bc30da8e502499bafb9ab2dbf1f8d62aeb9d41f32213394246ea59')

prepare() {
	cd ${pkgname%-lbonn-wayland}-$pkgver
	sed -i "s/xfce4-terminal.wrapper/xfce4-terminal/g" script/rofi-sensible-terminal
	# This is copied from the offical Arch rofi PKGBUILD.
	# I do not use xfce, so if this causes any issue please let me know.
}
build() {
	local meson_options=(-Dwayland=enabled -Dcheck=enabled)
	arch-meson ${pkgname%-lbonn-wayland}-$pkgver build "${meson_options[@]}"
	meson compile -C build
}

check() {
	LC_ALL=C meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir="${pkgdir}"
	install -Dm644 ${pkgname%-lbonn-wayland}-$pkgver/COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
	install -Dm755 ${pkgname%-lbonn-wayland}-$pkgver/Examples/*.sh -t "${pkgdir}/usr/share/doc/${pkgname%-lbonn-wayland}/examples"
}

# Maintainer: alive4ever <alive4ever at live.com>
pkgname=maynard-git
pkgver=r123.b23c2a8
pkgrel=2
pkgdesc="Lightweight desktop environment based on Weston compositor for use with Wayland"
arch=('x86_64' 'i686')
url="https://github.com/raspberrypi/maynard"
license=('custom:MIT' 'GPL')
provides=("maynard")
depends=("weston" "gnome-desktop" "gnome-menus")
optdepends=("xorg-server-xwayland: For running X11 applications")
makedepends=("git" "intltool")
install=maynard.install
source=("${pkgname%-git}::git+https://github.com/raspberrypi/maynard.git"
	"01-maynard.patch"
	"02-default-launchers.patch")

sha256sums=('SKIP'
	'939a16eb6b50343059f7bb0afa89eff9831ae67ea561101620e7dab009883f60'
	'77aa532e552f83612a53a0b6b51ad568d45a4318718298e69bec5da38e3629ea')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 < "$srcdir/01-maynard.patch"
	patch -p1 < "$srcdir/02-default-launchers.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr --libexecdir=/usr/lib/maynard --sysconfdir=/etc --bindir=/usr/bin --libdir=/usr/lib
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 LICENSE.GPL "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.GPL"
}

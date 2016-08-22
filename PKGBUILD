# Maintainer: alive4ever <alive4ever at live.com>
pkgname=maynard-git
pkgver=r121.a191e5c
pkgrel=1
pkgdesc="Lightweight desktop environment based on Weston compositor for use with Wayland"
arch=('x86_64' 'i686')
url="https://github.com/raspberrypi/maynard"
license=('custom:MIT' 'GPL')
provides=("maynard")
depends=("weston" "gnome-desktop" "gnome-menus")
makedepends=("git" "intltool")
install=maynard.install
source=("${pkgname%-git}::git+https://github.com/raspberrypi/maynard.git"
	"01-maynard.patch")
sha256sums=('SKIP'
	'07fb68ed8dcebca0ec9272ac0707b622a5c599e12ab0360947d031a572fff35c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 < "$srcdir/01-maynard.patch"
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
}

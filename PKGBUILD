# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('gamemode' 'lib32-gamemode')
pkgbase=gamemode
pkgver=1.6
pkgrel=5
pkgdesc="Optimise Linux system performance on demand"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode"
license=('BSD')
makedepends=('meson' 'lib32-systemd')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ede17eb042c1c87f7b35bfe96a00560afaea086f685d25bb3964d794b0af9c80')

build() {
	arch-meson "$pkgbase-$pkgver" build64 \
		--libexecdir lib/gamemode \
		-Dwith-pam-group=gamemode \
		-Dwith-systemd-user-unit-dir=/usr/lib/systemd/user
	meson compile -C build64

	export CFLAGS=-m32
	export CXXFLAGS=-m32
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	arch-meson "$pkgbase-$pkgver" build32  \
		--libdir lib32 \
		-Dwith-sd-bus-provider=no-daemon \
		-Dwith-examples=false \
		-Dwith-util=false
	meson compile -C build32
}

package_gamemode() {
	depends=('polkit' 'libinih')
	optdepends=('systemd')
	install="$pkgname.install"

	DESTDIR="$pkgdir" meson install -C build64

	cd "$pkgbase-$pkgver"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "example/$pkgname.ini" -t "$pkgdir/usr/share/doc/$pkgname/example"
}

package_lib32-gamemode() {
	depends=('gamemode' 'lib32-glibc' 'lib32-dbus')

	DESTDIR="$pkgdir" meson install -C build32

	rm -rf "$pkgdir/usr/include"

	cd "$pkgbase-$pkgver"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}


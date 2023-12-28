# Maintainer: Piroro-hs

pkgname=geoclue_fake-git
pkgver=0.r6.g0d7f9aa
pkgrel=4
pkgdesc="Fake Geoclue Service so that it doesn't need to phone home"
arch=('x86_64')
url="https://github.com/Grollicus/${pkgname%-git}"
license=('GPL')
groups=()
depends=('libdbus-1.so')
makedepends=('cargo' 'git')
provides=('geoclue' 'geoclue2')
conflicts=('geoclue' 'geoclue2')
replaces=()
backup=("etc/${pkgname%-git}.toml")
options=()
install=
source=("$pkgname::git+$url")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver=`git describe --long 2> /dev/null`
	if [ -z $ver ]; then
		ver="0-$(git rev-list --count HEAD)-g$(git rev-parse --short HEAD)"
	fi
	echo $ver | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "${pkgname%-git}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-git}.service"
	install -Dm644 org.freedesktop.GeoClue2.service "$pkgdir/usr/share/dbus-1/system-services/org.freedesktop.GeoClue2.service"
	install -Dm644 org.freedesktop.GeoClue2.conf "$pkgdir/usr/share/dbus-1/system.d/org.freedesktop.GeoClue2.conf"
	install -Dm644 config.default.toml "$pkgdir/etc/${pkgname%-git}.toml"
}

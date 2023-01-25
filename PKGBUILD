# Maintainer: nezu <nezu@nezu.cc>
pkgname=csgo-checker-electron
_pkgname=csgo-checker
pkgver=1.4.1
pkgrel=1
pkgdesc="Check CS:GO accounts for bans/cooldowns/wins/ranks (system electron)"
arch=('x86_64')
url="https://github.com/dumbasPL/csgo-checker"
license=('GPL3')
# current is 22
_electronversion=
depends=("electron$_electronversion<23.0.0")
makedepends=('nodejs>=12.10.0' 'npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dumbasPL/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
		"$_pkgname.sh.in"
		"$_pkgname.desktop")
sha256sums=('b2eab8c3d230fecf4a04cae2013649c2c170bd6120eb654b0f11313458038d11'
            'f5ee45943cd57290c6ef4578a56183b0910aacefb71f4459691cc44f4df891fd'
            'ca864ac4e882e43e5c6314029d2e40f1f2520e9418819483e6a47b684e7ce011')

build() {
	cd "$_pkgname-$pkgver"
	electronDist="/usr/lib/electron$_electronversion"
	electronVer="$(sed s/^v// $electronDist/version)"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	HOME="$srcdir/.electron-gyp" npm install --cache "$srcdir/npm-cache"
	./node_modules/.bin/electron-builder --linux --x64 --dir \
		$dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
	cd "$_pkgname-$pkgver"
	sed "s/@@VERSION@@/$_electronversion/" "$srcdir/$_pkgname.sh.in" > "$_pkgname.sh"
	install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$_pkgname/resources/"
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
	install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 build/icons/256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}

# Maintainer: Bruce Zhang
pkgname=firecamp
pkgver=1.4.4
pkgrel=1
pkgdesc="firecamp, A campsite for developers."
arch=('x86_64')
url="https://firecamp.app/"
license=('unknown')
depends=('electron8')
makedepends=('p7zip' 'asar')
provides=('firecamp')
options=('!strip')
source=(
    "$pkgname-$pkgver.orig.appimage::https://firecamp.ams3.digitaloceanspaces.com/versions/linux/Firecamp-$pkgver.AppImage"
	"path.patch"
)
sha256sums=('240c94d2b5242e39ffb27287abc9c9ba7456a204036db9dd46f97f5d47b277cd' 'SKIP')

prepare() {
	cd "$srcdir"
	7z x "$pkgname-$pkgver.orig.appimage" -ofirecamp
	cd firecamp/resources
	asar e app.asar app
	patch -s -p0 < "$srcdir/path.patch"
	echo "#!/usr/bin/env sh
export ELECTRON_IS_DEV=0
exec electron8 /usr/share/firecamp/app \$@ --no-sandbox" > "$srcdir/firecamp.sh"
}

package() {
	cd "$srcdir/firecamp/resources"
	mkdir -p "$pkgdir/usr/share/firecamp"
	cp -r app "$pkgdir/usr/share/firecamp/app"
	cp -r "$srcdir/firecamp/resources/node_modules/google-protobuf" "$pkgdir/usr/share/firecamp/app/node_modules"
	install -Dm755 "$srcdir/firecamp.sh" "$pkgdir/usr/bin/firecamp"
}

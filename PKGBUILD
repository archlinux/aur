# Maintainer: Bruce Zhang
pkgname=firecamp
pkgver=0.7.5
pkgrel=1
pkgdesc="firecamp, A campsite for developers."
arch=('x86_64')
url="https://firecamp.app/"
license=('unknown')
depends=('electron')
makedepends=('p7zip' 'asar')
provides=('firecamp')
options=('!strip')
source=(
    "$pkgname-$pkgver.orig.appimage::https://firecamp.ams3.digitaloceanspaces.com/versions/linux/Firecamp-$pkgver.AppImage"
    'runner.patch'
)
sha256sums=('06bbae83cd6c3c6f197e1b23a93b009cfc65333659a80b0963f3537b1db06d47'
            'f22a12c6b3ee55161ac9e8debadba48263fad338c13b6700d06261c2346426dd')

prepare() {
	cd "$srcdir"
	7z x "$pkgname-$pkgver.orig.appimage" -ofirecamp
	cd firecamp/resources
	asar e app.asar app
	patch -u app/electron.js -i "$srcdir/runner.patch"
	echo "#!/usr/bin/env sh
export ELECTRON_IS_DEV=0
exec electron /usr/share/firecamp/app \$@ --no-sandbox" > "$srcdir/firecamp.sh"
}

package() {
	cd "$srcdir/firecamp/resources"
	mkdir -p "$pkgdir/usr/share/firecamp"
	cp -r app "$pkgdir/usr/share/firecamp/app"
	install -Dm755 "$srcdir/firecamp.sh" "$pkgdir/usr/bin/firecamp"
}

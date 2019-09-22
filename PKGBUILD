# Maintainer: Bruce Zhang
pkgname=firecamp
pkgver=0.6.6
pkgrel=1
pkgdesc="firecamp, A campsite for developers."
arch=('x86_64')
url="https://firecamp.app/"
license=('unknown')
depends=('electron')
makedepends=('squashfs-tools' 'asar')
provides=('firecamp')
options=('!strip')
source=(
    "manual://firecamp_$pkgver.snap"
    'runner.patch'
)
sha256sums=('6ea77ac4124ac9d4ccdf3584c98bafa6d2ee2424de90186c352e1571759689db'
            'f22a12c6b3ee55161ac9e8debadba48263fad338c13b6700d06261c2346426dd')

prepare() {
	cd "$srcdir"
	unsquashfs -f -d firecamp "firecamp_$pkgver.snap"
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

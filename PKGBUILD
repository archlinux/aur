pkgname=passff-host
pkgver=1.1.0
pkgrel=1
epoch=1 # split off from passff addon versioning
pkgdesc="PassFF native messaging host application for Firefox, Chromium, Chrome, Vivaldi"
url=https://github.com/passff/passff-host
license=(GPL2)
depends=(python)
arch=(i686 x86_64)
source=(
	passff-$pkgver.py::https://github.com/passff/passff-host/releases/download/$pkgver/passff.py
	passff-$pkgver.json::https://github.com/passff/passff-host/releases/download/$pkgver/passff.json
)

_native_messaging=(
	/etc/chromium/native-messaging-hosts
	/etc/opt/chrome/native-messaging-hosts
	/usr/lib/mozilla/native-messaging-hosts
	/etc/vivaldi/native-messaging-hosts
)

_bindir="/usr/lib/passff"

build() {
	sed -i -e "s-PLACEHOLDER-$_bindir/passff.py-" "$srcdir/passff-$pkgver.json"
}

package() {
	install -d "$pkgdir$_bindir"
	install -m 0755 "$srcdir/passff-$pkgver.py" "$pkgdir$_bindir/passff.py"

	for d in "${_native_messaging[@]}"; do
		install -d "$pkgdir$d"
		install -m 0644 "$srcdir/passff-$pkgver.json" "$pkgdir$d/passff.json"
	done
}

# makepkg -g >> PKGBUILD
md5sums=('aeaf17856286c5a6dd81bb46466f5746'
         '2512ca1ab6da1c8fcfdfc4e7dd5a2fe8')

pkgname=passff-host
pkgver=1.0.7linux
pkgrel=1
pkgdesc="PassFF native messaging host application for Firefox, Chromium, Chrome, Vivaldi"
pkgurl=https://github.com/passff/passff
license=(GPL2)
depends=(python)
arch=(i686 x86_64)
source=(
	passff-$pkgver.py::https://github.com/passff/passff/releases/download/$pkgver/passff.py
	passff-$pkgver.json::https://github.com/passff/passff/releases/download/$pkgver/passff.json
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
md5sums=('9393b1628ba8dfa67f1a214eadfc4a05'
         '2512ca1ab6da1c8fcfdfc4e7dd5a2fe8')

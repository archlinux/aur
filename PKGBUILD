pkgname=passff-host
pkgver=1.0.3linux
pkgrel=1
pkgdesc="PassFF native messaging host application for Firefox, Chromium, Chrome, Vivaldi"
pkgurl=https://github.com/passff/passff
license=(GPL2)
depends=(python)
arch=(i686 x86_64)
source=(
	https://github.com/passff/passff/releases/download/$pkgver/passff.py
	https://github.com/passff/passff/releases/download/$pkgver/passff.json
)

_native_messaging=(
	/etc/chromium/native-messaging-hosts
	/etc/opt/chrome/native-messaging-hosts
	/usr/lib/mozilla/native-messaging-hosts
	/etc/vivaldi/native-messaging-hosts
)

_bindir="/usr/lib/passff"

build() {
	sed -i -e "s-PLACEHOLDER-$_bindir/passff.py-" "$srcdir/passff.json"
}

package() {
	install -d "$pkgdir$_bindir"
	install -m 0755 "$srcdir/passff.py" "$pkgdir$_bindir/"

	for d in "${_native_messaging[@]}"; do
		install -d "$pkgdir$d"
		install -m 0644 "$srcdir/passff.json" "$pkgdir$d/"
	done
}

# makepkg -g >> PKGBUILD
md5sums=('5cd5c222defecc1bb83444dbef7fd26f'
         '2512ca1ab6da1c8fcfdfc4e7dd5a2fe8')

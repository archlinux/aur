_basename=tridactyl
pkgname=$_basename-native-git
pkgver=1.14.8.r142.g618f7f6
pkgrel=1
url=https://github.com/tridactyl/tridactyl
pkgdesc="Tridactyl native messaging host application for Firefox, Chromium, Chrome, Vivaldi"
license=(GPL2)
depends=(python)
makedepends=(git)
arch=(i686 x86_64)
source=(git+https://github.com/tridactyl/tridactyl.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_basename"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_native_messaging=(
	/etc/chromium/native-messaging-hosts
	/etc/opt/chrome/native-messaging-hosts
	/usr/lib/mozilla/native-messaging-hosts
	/etc/vivaldi/native-messaging-hosts
)

_bindir="/usr/lib/tridactyl"

build() {
	sed -i -e "s-REPLACE_ME_WITH_SED-$_bindir/native_main.py-" "$srcdir/$_basename/native/tridactyl.json"
}

package() {
	install -d "$pkgdir$_bindir"
	install -m 0755 "$srcdir/$_basename/native/native_main.py" "$pkgdir$_bindir/native_main.py"

	for d in "${_native_messaging[@]}"; do
		install -d "$pkgdir$d"
		install -m 0644 "$srcdir/$_basename/native/tridactyl.json" "$pkgdir$d/tridactyl.json"
	done
}

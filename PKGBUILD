# Maintainer: nezu <nezu@nezu.cc>
pkgname=csgo-checker-git
_pkgname=csgo-checker
pkgver=1.4.2+r2+ga0e45d0
pkgrel=1
pkgdesc="Check CS:GO accounts for bans/cooldowns/wins/ranks (git)"
arch=('x86_64')
url="https://github.com/dumbasPL/csgo-checker"
license=('GPL3')
depends=(gtk3 libxss nss)
makedepends=(git npm python)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/dumbasPL/$_pkgname"
		"$_pkgname.desktop")
sha256sums=('SKIP'
            'ca864ac4e882e43e5c6314029d2e40f1f2520e9418819483e6a47b684e7ce011')

pkgver() {
	cd "$_pkgname"
	git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
	cd "$_pkgname"
	HOME="$srcdir/.electron-gyp" npm install --cache "$srcdir/npm-cache"
	./node_modules/.bin/electron-builder --linux --x64 --dir
}

package() {
	cd "$_pkgname"

	install -dm755 "$pkgdir/opt/$_pkgname"
	cp -a dist/linux-unpacked/. "$pkgdir/opt/$_pkgname"
	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin"

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname

	install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 icons/icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

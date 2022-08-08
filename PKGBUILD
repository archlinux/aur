# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=replugged-electron-git
_pkgname=${pkgname%-electron-*}
pkgver=r1543.86ae1cb8
pkgrel=1
pkgdesc="A fork of Powercord, the lightweight discord client mod focused on simplicity and performance."
arch=('any')
url="https://github.com/${_pkgname}-org/${_pkgname}"
license=('MIT')
depends=('electron19' 'discord-canary-electron-bin' 'curl' 'jq')
makedepends=('git' 'npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
_branch="main"
source=("git+https://github.com/${_pkgname}-org/${_pkgname}.git#branch=${_branch}"
		"$_pkgname.sh"
		"$_pkgname.desktop"
		"$_pkgname.png"
		"$_pkgname.patch"
		"$_pkgname-themes.patch"
		"$_pkgname-plugins.patch"
		"$_pkgname-updater.patch")
md5sums=('SKIP'
         '732a69778eed5923c08f57bba4dee67d'
         'ed7e42f11938c61e00c8c07cd1a96427'
         '4ddcb11a1ec0a8a9585a6f0b685286b4'
         'c989b875ff29492629f90e8f6b19c194'
         'd2dc5683278a2fbc677e917d557623fb'
         '048616be03e800a9e64ebbf02a20b96f'
         '655900c956345ab932b2b2b766a3ac6d')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 -i "$srcdir/$_pkgname.patch"
	patch -p1 -i "$srcdir/$_pkgname-themes.patch"
	patch -p1 -i "$srcdir/$_pkgname-updater.patch"

	sed -i "s:@PKG_UPSTREAM@:$_pkgname-org/$_pkgname:;s:@PKG_BRANCH@:${_branch}:;s:@PKG_REVISION@:$(git rev-parse ${_branch}):" src/Powercord/plugins/pc-updater/index.js

	patch -p1 -i "$srcdir/$_pkgname-plugins.patch"
}

build() {
	cd "$srcdir/$_pkgname"

	npm install --cache "${srcdir}/npm-cache" --omit=dev
}

check() {
	cd "$srcdir/$_pkgname"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname" 

	install -dm755 "$pkgdir/usr/share/$_pkgname"

	cp -ar * "$pkgdir/usr/share/$_pkgname"
	rm -rf "$pkgdir/usr/share/$_pkgname/"{test,LICENSE,README.md,release.sh,jsconfig.json,injectors,changelogs.json}

	# chmod -R u+rwX,go+rX,go-w "$pkgdir/usr/share/$_pkgname"

	echo "require('./src/patcher.js')" > "$pkgdir/usr/share/$_pkgname/index.js"

	install -D "$srcdir/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -D "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

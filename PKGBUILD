# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>

_electron='electron19'
_discord='discord-canary'

pkgname=replugged-electron-git
_pkgname="${pkgname%-electron-*}"
pkgver=r1997.4fa35914
pkgrel=1
pkgdesc="A fork of Powercord, the lightweight discord client mod focused on simplicity and performance."
arch=('any')
url="https://github.com/${_pkgname}-org/${_pkgname}"
license=('MIT')
depends=("$_electron" 'discord-canary-electron-bin')
makedepends=('git' 'pnpm')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
_branch="main"
source=("git+https://github.com/${_pkgname}-org/${_pkgname}.git#branch=${_branch}"
		"$_pkgname.sh"
		"$_pkgname.desktop"
		"$_pkgname.png"
		"$_pkgname.patch")
md5sums=('SKIP'
         'a94b9b81f16f2743504d390c6c0f45a0'
         '9698a7fbd4af735bee89e74fa0b03dfe'
         '4ddcb11a1ec0a8a9585a6f0b685286b4'
         '7705ffd25cebcc73277a1a957c1cbe63')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 -i "$srcdir/$_pkgname.patch"

	sed -i "s/@ELECTRON@/$_electron/" "$srcdir/$_pkgname.sh"
	sed -i "s/@DISCORD@/$_discord/" "$srcdir/$_pkgname/src/main/index.ts"

	# sed -i "s:@PKG_UPSTREAM@:$_pkgname-org/$_pkgname:;s:@PKG_BRANCH@:${_branch}:;s:@PKG_REVISION@:$(git rev-parse ${_branch}):" src/Powercord/coremods/updater/index.js
}

build() {
	cd "$srcdir/$_pkgname"

	pnpm i --store-dir "${srcdir}/pnpm-store"
	pnpm build
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname" 

	install -dm755 "$pkgdir/usr/share/$_pkgname"

	cp -ar dist/* "$pkgdir/usr/share/$_pkgname/"
	echo "require('./main.js');" > "$pkgdir/usr/share/$_pkgname/index.js"

	# chmod -R u+rwX,go+rX,go-w "$pkgdir/usr/share/$_pkgname"

	install -D "$srcdir/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -D "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

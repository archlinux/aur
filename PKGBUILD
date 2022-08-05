# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=powercord-electron-git
_pkgname=${pkgname%-electron-*}
pkgver=r1420.bb30f258
pkgrel=1
pkgdesc="A lightweight discord client mod focused on simplicity and performance."
arch=('any')
url="https://github.com/powercord-org/powercord"
license=('MIT')
depends=('electron15' 'discord-canary-electron-bin' 'curl' 'jq')
makedepends=('git' 'npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
_branch="v2"
source=('git+https://github.com/powercord-org/powercord.git#branch='${_branch}
		"$_pkgname.sh"
		"$_pkgname.desktop"
		"$_pkgname.png"
		"$_pkgname.patch"
		"$_pkgname-themes.patch"
		"$_pkgname-plugins.patch"
		"$_pkgname-updater.patch")
noextract=()
md5sums=('SKIP'
         'eca60a4608bfa313cafb2f1032e6e54d'
         'ed7e42f11938c61e00c8c07cd1a96427'
         '567d9d8abddefa0417035759348230d1'
         '48c86519998cea43876ee940b773dcc9'
         '765cdae376346f6e00748e5cfae6a493'
         'da933087c7183124c658b656397e1fc6'
         '02be4a13e993b42ab1c88376461dd281')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 -i "$srcdir/$_pkgname.patch"
	patch -p1 -i "$srcdir/$_pkgname-themes.patch"
	patch -p1 -i "$srcdir/$_pkgname-updater.patch"

	sed -i "s:@PKG_UPSTREAM@:powercord-org/powercord:;s:@PKG_BRANCH@:${_branch}:;s:@PKG_REVISION@:$(git rev-parse ${_branch}):" src/Powercord/plugins/pc-updater/index.js

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
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/powercord" 

	install -dm755 "$pkgdir/usr/share/$_pkgname"

	cp -r * "$pkgdir/usr/share/$_pkgname"
	rm -rf "$pkgdir/usr/share/$_pkgname/{test,LICENSE,README.md,release.sh,jsconfig.json}"

	# chmod -R u+rwX,go+rX,go-w $pkgdir/usr/share/powercord

	install -dm755 "$pkgdir/usr/share/$_pkgname/app"

	echo '{"main":"index.js","name":"discord"}' > "$pkgdir/usr/share/$_pkgname/app/package.json"
	echo 'require(`../src/patcher.js`)' > "$pkgdir/usr/share/$_pkgname/app/index.js"

	install -D "$srcdir/powercord.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -D "$srcdir/powercord.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

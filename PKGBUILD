# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=powercord-electron-git
_pkgname=${pkgname%-electron-*}
pkgver=r1340.b64b1449
pkgrel=1
pkgdesc="A lightweight discord client mod focused on simplicity and performance."
arch=('any')
url="https://github.com/powercord-org/powercord"
license=('custom:Porkord')
groups=()
depends=('electron13' 'discord-canary-electron-bin' 'curl' 'jq')
makedepends=('git' 'npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
_branch="v2"
source=('git+https://github.com/powercord-org/powercord.git#branch='${_branch} 
		'powercord.sh'
		"powercord.desktop"
		"powercord.png"
		"$_pkgname.patch"
		"$_pkgname-themes.patch"
		"$_pkgname-plugins.patch"
		"$_pkgname-updater.patch")
noextract=()
md5sums=('SKIP'
         'c84562562db227fda13210a9befc32f3'
         'ed7e42f11938c61e00c8c07cd1a96427'
         '567d9d8abddefa0417035759348230d1'
         '63b1a3b7097e89f695be3e51b6bfc071'
         'd2a25c91f0f31b461756b1204c5c5318'
         '926745d0ebfda9de7337e99e776bdd51'
         '4370ed3647d62b1f1cb0e791d960f253')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 -i "$srcdir/$_pkgname.patch"
	patch -p1 -i "$srcdir/$_pkgname-themes.patch"
	patch -p1 -i "$srcdir/$_pkgname-updater.patch"

	# git log -1 --pretty=format:%H
	sed -i "s:@PKG_UPSTREAM@:powercord-org/powercord:;s:@PKG_BRANCH@:${_branch}:;s:@PKG_REVISION@:$(git rev-parse ${_branch}):" src/Powercord/plugins/pc-updater/index.js

	patch -p1 -i "$srcdir/$_pkgname-plugins.patch"
}

build() {
	cd "$srcdir/$_pkgname"

	npm install --cache "${srcdir}/npm-cache" --only=prod
}

check() {
	cd "$srcdir/$_pkgname"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 $srcdir/powercord.sh "$pkgdir/usr/bin/powercord" 

	install -dm755 $pkgdir/usr/share/powercord

	cp -r * $pkgdir/usr/share/powercord
	rm -rf $pkgdir/usr/share/powercord/{test,LICENSE,README.md,release.sh,jsconfig.json}

	# chmod -R u+rwX,go+rX,go-w $pkgdir/usr/share/powercord

	install -dm755 $pkgdir/usr/share/powercord/app

	echo '{"main":"index.js","name":"discord"}' > $pkgdir/usr/share/powercord/app/package.json
	echo 'require(`../src/patcher.js`)' > $pkgdir/usr/share/powercord/app/index.js

	install -D "$srcdir/powercord.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -D "$srcdir/powercord.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	echo "Use the 'powercord' command to launch discord with powercord loaded"
	echo "also, please report bugs/errors to the AUR package page."
}

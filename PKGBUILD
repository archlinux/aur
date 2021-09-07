# Maintainer: Lukasz Marianski <lmarianski at protonmail dot com>
pkgname=powercord-electron-git
pkgver=r1313.5d7500d5
pkgrel=4
pkgdesc="A lightweight discord client mod focused on simplicity and performance."
arch=('any')
url="https://github.com/powercord-org/powercord"
license=('custom:Porkord')
groups=()
depends=('electron13' 'discord-canary-electron-bin')
makedepends=('git' 'npm')
provides=("${pkgname%-electron-git}")
conflicts=("${pkgname%-electron-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/powercord-org/powercord.git' 
		'powercord.sh'
		"${pkgname%-electron-git}.patch"
		"powercord.desktop"
		"powercord.png")
noextract=()
md5sums=('SKIP'
         '0da02ab7f1ca40d4fb9891bfb953a9b9'
         '709b434317999f01a9b28e02547f0d28'
         'ed7e42f11938c61e00c8c07cd1a96427'
         '567d9d8abddefa0417035759348230d1')

pkgver() {
	cd "$srcdir/${pkgname%-electron-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-electron-git}"

	patch -p1 -i "$srcdir/${pkgname%-electron-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-electron-git}"
}

check() {
	cd "$srcdir/${pkgname%-electron-git}"
}

package() {
	cd "$srcdir/${pkgname%-electron-git}"
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 $srcdir/powercord.sh "$pkgdir/usr/bin/powercord"

	npm install --cache "${srcdir}/npm-cache" 

	install -dm755 $pkgdir/opt/powercord
	cp -r * $pkgdir/opt/powercord
	chmod -R u+rwX,go+rX,go-w $pkgdir/opt/powercord

	install -d $pkgdir/usr/lib/powercord/app

	echo '{"main":"index.js","name":"discord"}' > $pkgdir/usr/lib/powercord/app/package.json
	echo 'require(`/opt/powercord/src/patcher.js`)' > $pkgdir/usr/lib/powercord/app/index.js

	install -D "$srcdir/powercord.png" "$pkgdir/usr/share/pixmaps/${pkgname%-electron-git}.png"
	install -D "$srcdir/powercord.desktop" "$pkgdir/usr/share/applications/${pkgname%-electron-git}.desktop"

	echo "Use the 'powercord' command to launch discord with powercord loaded"
}

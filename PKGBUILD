# Maintainer: Lukasz Marianski <lmarianski at protonmail dot com>
pkgname=powercord-electron-git
pkgver=r1313.5d7500d5
pkgrel=1
pkgdesc="A lightweight discord client mod focused on simplicity and performance."
arch=('any')
url="https://github.com/powercord-org/powercord"
license=('custom:Porkord')
groups=()
depends=('discord-canary-electron-bin')
makedepends=('git' 'npm')
provides=("${pkgname%-electron-git}")
conflicts=("${pkgname%-electron-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/powercord-org/powercord.git' 
		'powercord.sh'
		"${pkgname%-electron-git}.patch")
noextract=()
md5sums=('SKIP'
         '0da02ab7f1ca40d4fb9891bfb953a9b9'
         '709b434317999f01a9b28e02547f0d28')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-electron-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-electron-git}"

	# sed -i "s:dirname(require.main.filename):'/','usr','lib','discord-canary':" src/patcher.js

	patch -p1 -i "$srcdir/${pkgname%-electron-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-electron-git}"
	# ./autogen.sh
	# ./configure --prefix=/usr
	# make
}

check() {
	cd "$srcdir/${pkgname%-electron-git}"
	# make -k check
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

	echo -e "Use `powercord` to launch discord with powercord loaded"
}

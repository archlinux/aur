# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=joindesktop-git
pkgver=0.4.0.r67.14c017b
pkgrel=1
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('none')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('libnotify: for native notifications')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/JoinDesktop.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '59746e474ebed1e32f93b2732da8d2d19fc47d53696c787142f672372606281f'
            'b6d1d5ce0e3e41b63924c4710fb73a7cb556ef1dccaad52f5b3d2d585d5a03fe')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "$(node -pe "require('./package.json').version").r%s.%s" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	npm install --cache "$srcdir/npm-cache"
	npm run pack
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/lib/${pkgname%-git}"
	cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/${pkgname%-git}"

	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 images/join.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}

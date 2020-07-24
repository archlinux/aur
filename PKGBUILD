# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=joindesktop-git
pkgver=0.3.0.r49.4902203
pkgrel=1
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('none')
depends=('gtk3' 'nss' 'libxss')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/JoinDesktop.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.png")
sha256sums=('SKIP'
            'bb025c90171a0cff9d0bae5199c2fd27e410646a988e4bb521820a4ebe3809c8'
            '83f862e08f58e69e983392be425bbec96d9d0a92dde42b4c2ce550280f3f5172')

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
	install -d "$pkgdir/opt/Join Desktop"
	cp -r dist/linux-unpacked/* "$pkgdir/opt/Join Desktop"

	install -d "$pkgdir/usr/bin"
	ln -sf '/opt/Join Desktop/com.joaomgcd.join' "$pkgdir/usr/bin/${pkgname%-git}"

	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/${pkgname%-git}.png" -t "$pkgdir/usr/share/pixmaps"
}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=joindesktop-git
pkgver=0.3.0.r49.4902203
pkgrel=2
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
        "${pkgname%-git}.png"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '59746e474ebed1e32f93b2732da8d2d19fc47d53696c787142f672372606281f'
            '83f862e08f58e69e983392be425bbec96d9d0a92dde42b4c2ce550280f3f5172'
            'd63bcc08a4b5e1b1b09efcf0a3f55694e3542eb75fa38ea1a8229b805fa41d8c')

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
	cp -r dist/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname%-git}"

	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/${pkgname%-git}.png" -t "$pkgdir/usr/share/pixmaps"
}

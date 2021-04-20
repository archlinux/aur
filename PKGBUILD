# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=joindesktop-git
pkgver=0.5.1.r0.g2baf670
pkgrel=1
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('unknown')
depends=('electron9')
makedepends=('git' 'npm')
optdepends=('libnotify: for native notifications')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/JoinDesktop.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '59746e474ebed1e32f93b2732da8d2d19fc47d53696c787142f672372606281f'
            '306bd114d7229fb09f2ff5a8fae8c544d74092654a4d9652e1a2579706250bda')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
#	printf "$(node -pe "require('./package.json').version").r%s.%s" \
#		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

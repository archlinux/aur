# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=headset
pkgver=3.2.1
pkgrel=1
pkgdesc="Discover and collect music on YouTube"
arch=('x86_64')
url="https://headsetapp.co"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/headsetapp/headset-electron/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('d0cba6c917ebda6f62a7cec8203b4e82e888aeac84b468385f880cd23ff4f6d6'
            '3bc18b531f1e914e317267a570241855dbf11b27347435fe4770d75b74958123')

build() {
	cd "$pkgname-electron-$pkgver"
	npm ci --cache "$srcdir/npm-cache"

	node_modules/.bin/electron-packager . \
		--executable-name headset \
		--ignore "(^/bin$|^/sig$|^/gh-pages$|^/player$|^/test$|Procfile|\.md$|^\.|^\/\.)" \
		--prune true \
		--out build/ \
		--overwrite \
		--asar \
		--platform=linux \
		--arch=x64
}

package() {
	cd "$pkgname-electron-$pkgver"

	# Fix file permissions
	find build/Headset-linux-x64 -type f -exec chmod 0644 {} +
	find build/Headset-linux-x64 -type d -exec chmod 0755 {} +
	chmod 0755 build/Headset-linux-x64/"$pkgname"

	install -d "$pkgdir/opt/$pkgname"
	cp -r build/Headset-linux-x64/* "$pkgdir/opt/$pkgname"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 "src/icons/$pkgname.png" -t "$pkgdir/usr/share/pixmaps"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

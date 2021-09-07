# Maintainer: 
# Contributor: FabioLolix
# Contributor: 7k5x <7k5xlp0onfire@gmail.com>

pkgname=headset-git
pkgver=3.2.1.r78.gbc451cf
pkgrel=1
provides=('headset')
conflicts=('headset')
pkgdesc="Discover and collect music on YouTube"
arch=('x86_64')
url="https://headsetapp.co"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss')
makedepends=('npm' 'git')
source=("git+https://github.com/headsetapp/headset-electron.git"
        "headset.desktop")
sha256sums=('SKIP'
            '4c19f792f923c567eb5b98d5169ecadf31d86a6403e39f68e14c6419c2ed4b98')

pkgver() {
	cd "$srcdir/headset-electron"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/headset-electron"

	# https://github.com/typicode/husky/issues/851
	git init .

	npm ci --cache "$srcdir/npm-cache"

	${srcdir}/headset-electron/node_modules/.bin/electron-packager . \
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
	cd "${srcdir}/headset-electron"
	# Fix file permissions
	find ${srcdir}/headset-electron/build/Headset-linux-x64 -type f -exec chmod 0644 {} +
	find ${srcdir}/headset-electron/build/Headset-linux-x64 -type d -exec chmod 0755 {} +
	chmod 0755 ${srcdir}/headset-electron/build/Headset-linux-x64/"headset"

	install -d "$pkgdir/opt/headset"
	cp -r build/Headset-linux-x64/* "$pkgdir/opt/headset"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/headset/headset" "$pkgdir/usr/bin/headset"

	install -Dm644 "$srcdir/headset.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 "src/icons/headset.png" -t "$pkgdir/usr/share/pixmaps"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/headset"
}

# Maintainer: 7k5x <7k5xlp0onfire@gmail.com>
pkgname=headset-git
pkgver=3.3.3.g981a492
pkgrel=1
provides=('headset')
conflicts=('headset')
pkgdesc="Discover and collect music on YouTube"
arch=('x86_64')
url="https://headsetapp.co"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss')
makedepends=('npm' 'git')
source=("headset.desktop")
sha256sums=('SKIP')

prepare() {
	if [ ! -d ${srcdir}/headset-electron ]; then
	git clone --depth=1 https://github.com/headsetapp/headset-electron.git
	fi
}

post_install() {
	update-desktop-database -q
}
pkgver() {
	cd "$srcdir/headset-electron"
	printf "%s.g%s" "$(curl -s https://github.com/headsetapp/headset-electron/releases/latest | cut -f 8 -d"/" | cut -f 1 -d"\"" | cut -f 2 -d"v")" "$(git rev-parse --short HEAD)"
}

build() {
	if [ -d ${srcdir}/headset-electron ]; then
	cd "${srcdir}/headset-electron"
	fi

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
	if [ -d ${srcdir}/headset-electron ]; then
	cd "${srcdir}/headset-electron"
	fi
	# Fix file permissions
	find ${srcdir}/headset-electron/build/Headset-linux-x64 -type f -exec chmod 0644 {} +
	find ${srcdir}/headset-electron/build/Headset-linux-x64 -type d -exec chmod 0755 {} +
	chmod 0755 ${srcdir}/headset-electron/build/Headset-linux-x64/"headset"

	install -d "$pkgdir/opt/headset"
	cp -r build/Headset-linux-x64/* "$pkgdir/opt/headset"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/headset/headset" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$srcdir/headset.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 "src/icons/headset.png" -t "$pkgdir/usr/share/pixmaps"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/headset"
}

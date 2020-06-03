# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ooniprobe-desktop
pkgver=3.0.2
pkgrel=1
pkgdesc="The next generation OONI Probe desktop app"
arch=('x86_64')
url="https://ooni.org"
license=('MIT')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
makedepends=('yarn')
conflicts=("${pkgname%-desktop}")
replaces=("${pkgname%-desktop}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ooni/probe-desktop/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('1f57e82ba0eda7ba12a7dc1c57a75031d4d82ea61f74d8a147c82af4cdceffff'
            'baaf4f3cca079dddc0b4e048c8778c6cc84786bb88fd9d218424b7b9f04f1135')

prepare() {
	cd "probe-desktop-$pkgver"

	# Disable building of rpm & tar.gz
	sed -i 's/"deb",/"deb"/g' package.json
	sed -i '41,42d' package.json
}

build() {
	cd "probe-desktop-$pkgver"
	yarn install --cache-folder "$srcdir/yarn-cache"
	yarn run probe-cli
	yarn run pack:linux
}

package() {
	cd "probe-desktop-$pkgver"
	install -dm755 "$pkgdir/opt/OONI Probe"
	cp -a dist/linux-unpacked/* "$pkgdir/opt/OONI Probe"

	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/OONI Probe/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	for icon_size in 16 48; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/icon_${icon_size}x${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	for icon_size in 32 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/app_${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done
}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=downzemall
pkgver=2.0.3
pkgrel=1
pkgdesc="A mass download manager based on the Qt5 framework and written in C/C++"
arch=('x86_64')
url="https://setvisible.github.io/DownZemAll"
license=('LGPL3' 'CC BY-SA 3.0')
depends=('qt5-base' 'youtube-dl')
makedepends=('boost' 'cmake')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/setvisible/DownZemAll/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('9250fe80ba002ad0d10cf7bae774531a01fe74afbace99e5658ddbffb65791cb'
            '3cb8f2eefbd9f04dd4b3a706058d8ab82c42514db81fbfbdf213fc833ca01eff')

prepare() {
	cd "DownZemAll-$pkgver"
	sed -i 's|ABSOLUTE/PATH/TO/APP/DIRECTORY|opt/downzemall|g' \
		web-extension/launcher/unix/*.json
}

build() {
	cd "DownZemAll-$pkgver"
	cmake -B build -S . \
		-DENABLE_TESTS:BOOL='OFF' \
		-Wno-dev
	make -C build
}

package() {
	cd "DownZemAll-$pkgver"
	install -Dm755 build/{launcher,DownZemAll} -t "$pkgdir/opt/$pkgname"
	install -Dm644 src/locale/*.qm -t "$pkgdir/opt/$pkgname/locale"

	install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
		"$pkgdir/etc/chromium/native-messaging-hosts/DownRightNow.json"
	install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
		"$pkgdir/etc/opt/chrome/native-messaging-hosts/DownRightNow.json"
	install -Dm644 web-extension/launcher/unix/launcher-manifest-firefox.json \
		"$pkgdir/usr/lib/mozilla/native-messaging-hosts/DownRightNow.json"

	install -Dm644 *.md -t "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 src/icons/logo/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LOGO_LICENSE"

	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 src/icons/logo/DownZemAll.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.png"
	for icon_size in 16 24 32 48 64 128 256 512 1024; do
		icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 src/icons/logo/icon${icon_size}.png \
			$pkgdir/$icons_dir/$pkgname.png
	done

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/DownZemAll" "$pkgdir/usr/bin/$pkgname"

	ln -s /usr/bin/youtube-dl "$pkgdir/opt/$pkgname/youtube-dl"

	touch "$pkgdir/opt/$pkgname/queue.json"
	chmod 777 "$pkgdir/opt/$pkgname/queue.json"
}

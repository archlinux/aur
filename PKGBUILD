# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=downzemall
pkgver=2.2.0
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
sha256sums=('6b445a0f61b2ec5f40211cae8de5f1ed3222176cf39af2d4c0fef2ea667eb81b'
            '3cb8f2eefbd9f04dd4b3a706058d8ab82c42514db81fbfbdf213fc833ca01eff')

prepare() {
	cd "DownZemAll-$pkgver"
	sed -i 's|ABSOLUTE/PATH/TO/APP/DIRECTORY|opt/downzemall|g' \
		web-extension/launcher/unix/*.json
}

build() {
	cd "DownZemAll-$pkgver"
	cmake -B build -S . \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
		-DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
		-DENABLE_TESTS=OFF \
		-Wno-dev
	make -C build
}

package() {
	cd "DownZemAll-$pkgver"
	install -Dm755 build/{launcher,DownZemAll} -t "$pkgdir/opt/$pkgname"
	install -Dm644 src/locale/*.qm -t "$pkgdir/opt/$pkgname/locale"

	install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
		"$pkgdir/etc/chromium/native-messaging-hosts/com.setvisible.downrightnow.json"
	install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
		"$pkgdir/etc/opt/chrome/native-messaging-hosts/com.setvisible.downrightnow.json"
	install -Dm644 web-extension/launcher/unix/launcher-manifest-firefox.json \
		"$pkgdir/usr/lib/mozilla/native-messaging-hosts/DownRightNow.json"

	install -Dm644 src/icons/logo/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LOGO_LICENSE"

	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 src/icons/logo/DownZemAll.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
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

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname=radicle-upstream-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Desktop client for Radicle code collaboration protocol'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=('upstream-bin')
source=("$pkgname-$pkgver.AppImage::https://releases.radicle.xyz/${pkgname%-bin}-$pkgver.AppImage"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/radicle-dev/${pkgname%-bin}/v$pkgver/LICENSE")
sha256sums=('5461244cdab1d649fbc5ca5271eaca74d6d7e22402fad469743db81c09f94d80'
            'f296a5d3ec56bed4f3a20d2d29fa700eadca035d7f3db4be38071b1ae9ddcb91')

PURGE_TARGETS=('AppRun')

prepare() {
	chmod +x "$pkgname-$pkgver.AppImage"
	"./$pkgname-$pkgver.AppImage" --appimage-extract &>/dev/null
	rm -rf upstream
	mv squashfs-root upstream

	find upstream -type d -exec chmod 755 '{}' \+
	chmod 755 upstream/radicle-upstream
	sed -i 's/AppRun/upstream/g' upstream/radicle-upstream.desktop
}

package() {
	install -d "$pkgdir/opt/"
	cp -a --no-preserve=ownership upstream/. "$pkgdir/opt/upstream/"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/upstream/radicle-upstream" "$pkgdir/usr/bin/upstream"

	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "$srcdir/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
	install -Dm644 "$srcdir/upstream/radicle-upstream.desktop" -t "$pkgdir/usr/share/applications/"
}

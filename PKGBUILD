# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname=radicle-upstream-bin
pkgver=0.2.13
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
sha256sums=('be3da3808cd36e0cec0cc5b0414cf234bb57b80d84c950193c2bf444a38a17c5'
            'd1bb5e1a4cd3774790ae7024904d572c27267857ed004a062416d520bf4230ad')

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
	cp -a upstream/. "$pkgdir/opt/upstream/"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/upstream/radicle-upstream" "$pkgdir/usr/bin/upstream"

	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "$srcdir/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
	install -Dm644 "$srcdir/upstream/radicle-upstream.desktop" -t "$pkgdir/usr/share/applications/"
}

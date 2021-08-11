# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname=upstream-bin
pkgver=0.2.9
pkgrel=1
pkgdesc='Desktop client for radicle (binary version)'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=('upstream')
conflicts=('radicle' 'upstream')
source=("$pkgname-$pkgver.AppImage::https://releases.radicle.xyz/radicle-upstream-$pkgver.AppImage"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/radicle-dev/radicle-upstream/v${pkgver}/LICENSE"
)
sha256sums=('7218eedd910514b3b313d15a9142b68b39bfe5e8c42dd2ff89632d3376d1a566'
            'd1bb5e1a4cd3774790ae7024904d572c27267857ed004a062416d520bf4230ad')

prepare() {
	chmod +x "$pkgname-$pkgver.AppImage"
	"./$pkgname-$pkgver.AppImage" --appimage-extract &>/dev/null
	rm -rf upstream
	mv squashfs-root upstream
}

package() {
	install -d -m755 "${pkgdir}/opt/"
	cp -a "${srcdir}/upstream/." "${pkgdir}/opt/upstream/"
	find "${pkgdir}/opt/upstream/" -type d -exec chmod 755 {} +
	chmod +rx "${pkgdir}/opt/upstream/radicle-upstream"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/upstream/radicle-upstream" "${pkgdir}/usr/bin/upstream"

	install -Dm644 "${srcdir}/LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radicle-upstream.png"
	install -Dm644 "${srcdir}/upstream/radicle-upstream.desktop" "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
	sed -e "s/AppRun/upstream/g" -i "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
}

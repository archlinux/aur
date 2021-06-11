# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname=upstream-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='Desktop client for radicle (binary version)'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=('upstream')
conflicts=('radicle' 'upstream')
_package="radicle-upstream-${pkgver}.AppImage"
source=("$pkgname-$pkgver.AppImage::https://releases.radicle.xyz/radicle-upstream-$pkgver.AppImage"
        "https://raw.githubusercontent.com/radicle-dev/radicle-upstream/v${pkgver}/LICENSE"
)
sha256sums=('510290af496dfcf4fc366689a3089027557b83f2d0a744b9c21a1fe96bda1da6'
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

	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	install -Dm644 "${srcdir}/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radicle-upstream.png"
	install -Dm644 "${srcdir}/upstream/radicle-upstream.desktop" "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
	sed -e "s/AppRun/upstream/g" -i "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
}

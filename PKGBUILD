# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname=eso-logs-uploader-bin
pkgver=5.9.0
pkgrel=2
pkgdesc="Official log uploader application for esologs.com"
arch=('any')
url="https://github.com/RPGLogs/Uploaders-esologs"
license=('custom:CC0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
makedepends=('asar')
options=('!strip')
source=("${pkgname%-bin}-$pkgver.AppImage::$url/releases/download/v$pkgver/ESO-Logs-Uploader-$pkgver.AppImage"
        'eso-logs-uploader.sh'
        'main.js.patch')
sha256sums=('21a77c9730a917ce75db709730969a10c9a19b42beda93558fb5ade67d1b70af'
            '6b260619df25c8f73b2ad252462480745130d3a2d51eb8be431e55f81e637239'
            'bc880cedc36a76f0a6ae901da4ca648ea5751d507463e960d03f3ce8b3f4948a')

prepare() {
    cd "$srcdir"
    rm -rf "squashfs-root" "${pkgname%-bin}"
    chmod u+x "${pkgname%-bin}-$pkgver.AppImage"
    "./${pkgname%-bin}-$pkgver.AppImage" --appimage-extract
    asar e "squashfs-root/resources/app.asar" "${pkgname%-bin}"

    mv "${pkgname%-bin}/LICENSE.md" "${pkgname%-bin}/README.md" .
    patch "${pkgname%-bin}/main.js" "main.js.patch"
    sed -i 's/^\(Exec=\).*$/\1eso-logs-uploader/' "squashfs-root/esologs.desktop"
}

package() {
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
    install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "$srcdir/squashfs-root/esologs.desktop" "$pkgdir/usr/share/applications/esologs.desktop"

    for res in '16' '32' '48' '64' '128' '256' '512'; do
        install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/${res}x$res/apps/esologs.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x$res/apps/esologs.png"
    done

    cp -r "$srcdir/${pkgname%-bin}" "$pkgdir/usr/share/"
}

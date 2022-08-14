# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname=eso-logs-uploader-bin
pkgver=5.9.1
pkgrel=1
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
        'no-devtools.patch'
        'no-ads.patch')
sha256sums=('f4910aef9ff0ed7681bd966224afb80a81abda13d9437707f4451dade64812f6'
            '6b260619df25c8f73b2ad252462480745130d3a2d51eb8be431e55f81e637239'
            '0d1ee7d16d8e226a78300e5f20d6bb743bd194aa68090adccd436952f0b0d287'
            '53c3b564c22088ba45bc6c6a9c6e0c7cf9be126caad9cb77cf88f85973701df0')

prepare() {
    cd "$srcdir"
    rm -rf "squashfs-root" "${pkgname%-bin}"
    chmod u+x "${pkgname%-bin}-$pkgver.AppImage"
    "./${pkgname%-bin}-$pkgver.AppImage" --appimage-extract
    asar e "squashfs-root/resources/app.asar" "${pkgname%-bin}"

    mv "${pkgname%-bin}/LICENSE.md" "${pkgname%-bin}/README.md" .
    sed -i 's/^\(Exec=\).*$/\1eso-logs-uploader/' "squashfs-root/esologs.desktop"

    cd "${pkgname%-bin}"
    patch -p1 < "$srcdir/no-devtools.patch"
    patch -p1 < "$srcdir/no-ads.patch"
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

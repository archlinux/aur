# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=1.0.0
# sometimes, they release without bumping the version
_release=2
pkgrel=6
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('unknown' 'APACHE' 'MIT')
url='https://tetr.io/'
source=("$pkgname-$pkgver-$_release.tar.gz::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.tar.gz"
        tetrio-desktop.desktop
        tetrio-desktop.png)
sha256sums=('cb23feff26a37e5a51036c59d97af97ae72323f7023faec64e8d90afa86802ef'
            '0ad0118764c582e0ea9983856a450ce9ea2a77307224a54e4c3e0363216d0970'
            'e7b9d7639b4b51e43836a08dab3fcf8055b12dfb87f18d60ded93963146743f0')
noextract=("$pkgname-$pkgver-$_release.tar.gz")

package() {
    cd "$srcdir"

    mkdir "$pkgdir/opt"
    tar -xzf "$pkgname-$pkgver-$_release.tar.gz" -C "$pkgdir/opt"
    mv "$pkgdir/opt/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

    rm "$pkgdir/opt/$pkgname/LICENSES.chromium.html"
    rm "$pkgdir/opt/$pkgname/LICENSE.electron.txt"

    # fix permissions
    chmod -R 644 "$pkgdir/opt/$pkgname"
    find "$pkgdir/opt/$pkgname" \
        \( -type d -o -name '*.so' -o -name tetrio-desktop -o -name chrome-sandbox \) \
        -exec chmod 755 {} +

    install -Dm644 tetrio-desktop.png "$pkgdir/usr/share/pixmaps/tetrio-desktop.png"
    install -Dm644 tetrio-desktop.desktop "$pkgdir/usr/share/applications/tetrio-desktop.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}

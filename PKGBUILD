# Maintainer: Adrian Schmitz <zetabite.horzion@gmail.com>
pkgname=irony-mod-manager-bin
pkgver=1.24.81
pkgrel=1
pkgdesc="A mod manager and launcher for Paradox Interactive games"
arch=('x86_64')
url="https://github.com/bcssov/IronyModManager"
license=('MIT')
depends=("fontconfig" "bash" "zlib" "krb5" "lttng-ust" "imagemagick")
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/bcssov/IronyModManager/releases/download/v$pkgver/linux-x64.zip"
        "$pkgname.png::https://raw.githubusercontent.com/bcssov/IronyModManager/v$pkgver/src/IronyModManager/Assets/logo.png"
        "$pkgname.desktop"
        "$pkgname.sh"
        "$pkgname.README.md"
        "disable-update.patch")
sha256sums=('0aaf26d8ffe7e468c3ab4db0b8b6af45a1956ab05fb0a4398233538a0bbb8d40'
            '3986b286a65add808bcd9be696501e685c4ee712b2c25139449bb282263e7e47'
            '43c8454a1d74fa0f0d2bdeae41836c5a73c079d1fb915c3fd709086d119c87a7'
            'bf522e178388d52f959348e0a0406a37ff16181b50eb848398a753cd6ebe1237'
            'acbb98b22127ec04aec858d1fd6767526eb78c6a10b3e091f040dfe503b29a8e'
            'cafa0f7d84e49d9a26082e839db1dfcf0f87ca8462aca050007690d5565a7157')
noextract=("$pkgname-$pkgver-$pkgrel.zip")

prepare() {
    mkdir -p $pkgname-$pkgver && bsdtar -xf $pkgname-$pkgver-$pkgrel.zip -C $pkgname-$pkgver
}

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"

    cd "$srcdir/$pkgname-$pkgver/"
    patch "appSettings.json" < "$srcdir/disable-update.patch"

    cp -R "$srcdir/$pkgname-$pkgver" -T "$pkgdir/opt/$pkgname/"

    install -m644 -D "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -m644 -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 -D "$srcdir/$pkgname.README.md" "$pkgdir/opt/$pkgname/README.md"
    install -m644 -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -m755 -D "$srcdir/$pkgname-$pkgver/IronyModManager" "$pkgdir/opt/$pkgname/IronyModManager"
    install -m755 -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

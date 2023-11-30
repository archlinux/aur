# Maintainer: Adrian Schmitz <zetabite.horzion@gmail.com>
pkgname=irony-mod-manager-bin
pkgver=1.25.150
pkgrel=1
pkgdesc="A mod manager and launcher for Paradox Interactive games"
arch=('x86_64')
url="https://github.com/bcssov/IronyModManager"
license=('MIT')
depends=("fontconfig" "bash" "zlib" "krb5" "lttng-ust" "imagemagick")
source=("$pkgname-$pkgver.zip::https://github.com/bcssov/IronyModManager/releases/download/v$pkgver/linux-x64.zip"
        "$pkgname.png::https://raw.githubusercontent.com/bcssov/IronyModManager/v$pkgver/src/IronyModManager/Assets/logo.png"
        "$pkgname.desktop"
        "$pkgname.sh"
        "$pkgname.README.md"
        "disable-update.patch")
sha256sums=('da04a3ec7677d7795e6a534681d144984850b72ea01b850d589e9d779d83b9cf'
            '3986b286a65add808bcd9be696501e685c4ee712b2c25139449bb282263e7e47'
            '43c8454a1d74fa0f0d2bdeae41836c5a73c079d1fb915c3fd709086d119c87a7'
            'bf522e178388d52f959348e0a0406a37ff16181b50eb848398a753cd6ebe1237'
            'acbb98b22127ec04aec858d1fd6767526eb78c6a10b3e091f040dfe503b29a8e'
            '081720fd50c752fdad4931075aa9a2fabb3a2c0f2ebceb6392d02fea661ec2dc')
noextract=("$pkgname-$pkgver.zip")

prepare() {
    mkdir -p $pkgname-$pkgver && bsdtar -xf $pkgname-$pkgver.zip -C $pkgname-$pkgver
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
    install -m755 -D "$srcdir/$pkgname-$pkgver/IronyModManager.GameHandler" "$pkgdir/opt/$pkgname/IronyModManager.GameHandler"
    install -m755 -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

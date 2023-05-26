# Maintainer: Adrian Schmitz <zetabite.horzion@gmail.com>
pkgname=irony-mod-manager-bin
pkgver=1.24.136
pkgrel=2
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
sha256sums=('d268588121e13abc17959ccf879d4524936a1ba9209931b09bdb1e49808116a3'
            '3986b286a65add808bcd9be696501e685c4ee712b2c25139449bb282263e7e47'
            '43c8454a1d74fa0f0d2bdeae41836c5a73c079d1fb915c3fd709086d119c87a7'
            'bf522e178388d52f959348e0a0406a37ff16181b50eb848398a753cd6ebe1237'
            'acbb98b22127ec04aec858d1fd6767526eb78c6a10b3e091f040dfe503b29a8e'
            '55f4c6975648c24dd0fb3cd06c4add517bb62e318890e1597d826780cbf4757f')
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

# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

_channel=latest
pkgname="tws-$_channel"
_pkgver=10.12
pkgver="$_pkgver.2c"
pkgrel=1
pkgdesc='IntereactiveBrokers Trader Workstation'
arch=('x86_64')
url='https://www.interactivebrokers.com/en/trading/tws.php#tws-software'
license=('custom')
depends=()
optdepends=()
source=("https://download2.interactivebrokers.com/installers/tws/$_channel-standalone/$pkgname-standalone-linux-x64.sh")
sha512sums=('067ddb23e69b53412401e8bc19bf3815fe3cd832c8b8563377fedd6da7beacadd1e058205c8e4fbf270a8dc5f4dca1840a7f43b6e0875cfacddea409046383ad')

prepare() {
    # unattended mode
    sh "./$pkgname-standalone-linux-x64.sh" -q -dir "$srcdir/$pkgname" -overwrite
    sed -i "s|$srcdir/$pkgname|/opt/$pkgname|" \
        "$srcdir/$pkgname/tws.vmoptions" \
        "$srcdir/$pkgname/Trader Workstation $_pkgver.desktop" \
        "$srcdir/$pkgname/.install4j/response.varfile" \
        "$srcdir/$pkgname/.install4j/install.prop" \
        "$srcdir/$pkgname/.install4j/files.log" \
        "$srcdir/$pkgname/.install4j/installation.log"
}

package() {
    cd ${srcdir}

    install -d "$pkgdir/opt/$pkgname"
    cp -a $srcdir/$pkgname/. "$pkgdir/opt/$pkgname"

    chmod 755 "$pkgdir/opt/$pkgname"

    install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
    ln -s /opt/$pkgname/tws "$pkgdir"/usr/bin/$pkgname
    ln -s /opt/$pkgname/.install4/tws.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    ln -s "/opt/$pkgname/Trader Workstation $_pkgver.desktop" "$pkgdir"/usr/share/applications/$pkgname.desktop
}

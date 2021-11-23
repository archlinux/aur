# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

_channel=latest
pkgname="ibgateway"
_pkgver=10.11
pkgver="$_pkgver.2f"
pkgrel=1
pkgdesc='IntereactiveBrokers Gateway'
arch=('x86_64')
url='https://www.interactivebrokers.com/en/?f=%2Fen%2Ftrading%2Fibgateway-latest.php'
license=('custom')
depends=()
optdepends=()
source=("https://download2.interactivebrokers.com/installers/$pkgname/$_channel-standalone/$pkgname-$_channel-standalone-linux-x64.sh")
sha512sums=('2c408f47f5a3ab1ad9beb695d514e9ea67eabc1dbc423862111d13adb147e50fd1b953e4681a874cf355cc8c8405bd298138d6263e2dae55a7516bfe1e6b723b')

prepare() {
    # unattended mode
    sh "./$pkgname-$_channel-standalone-linux-x64.sh" -q -dir "$srcdir/$pkgname" -overwrite
    sed -i "s|$srcdir/$pkgname|/opt/$pkgname|" \
        "$srcdir/$pkgname/$pkgname.vmoptions" \
        "$srcdir/$pkgname/IB Gateway $_pkgver.desktop" \
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
    ln -s /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
    ln -s /opt/$pkgname/.install4/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    ln -s "/opt/$pkgname/IB Gateway $_pkgver.desktop" "$pkgdir"/usr/share/applications/$pkgname.desktop
}

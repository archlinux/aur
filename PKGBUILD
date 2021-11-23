# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

_channel=latest
pkgname="tws-$_channel"
_pkgver=10.11
pkgver="$_pkgver.2f"
pkgrel=1
pkgdesc='IntereactiveBrokers Trader Workstation'
arch=('x86_64')
url='https://www.interactivebrokers.com/en/trading/tws.php#tws-software'
license=('custom')
depends=()
optdepends=()
source=("https://download2.interactivebrokers.com/installers/tws/$_channel-standalone/$pkgname-standalone-linux-x64.sh")
sha512sums=('64646cd42622607353bfbe46881edf98fcb3bc091836ba2ba374c4edef0fbcf069498cedf47b59c369eb6f7f617a396f2839505a973a11244dfc88c2e03f6885')

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

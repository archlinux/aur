# Maintainer: Julio Gonzalez <juliolokooo AT gmail DOT com>
# Contributor: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo
pkgver=6.3.0
pkgrel=2
pkgdesc="A multi-agent programmable modeling environment."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"  ] && _NARCH=32
[ "$CARCH" = "x86_64" ] && _NARCH=64
license=('LGPL' 'custom')
url="http://ccl.northwestern.edu/netlogo/"
depends=('java-environment')
makedepends=('gendesk')
optdepends=('alsa-lib' 'libnet' 'gtk2' 'gcc-libs-multilib')
install=$pkgname.install
source=(http://ccl.northwestern.edu/netlogo/$pkgver/NetLogo-$pkgver-$_NARCH.tgz
        netlogo.png)
[[ $_NARCH = 32 ]] && md5sums=('a27b68942bea414637efb89c2fb910f4' 'SKIP')
[[ $_NARCH = 64 ]] && md5sums=('e66b20e33fc2eeea3c2542c6a08e6ecd' 'SKIP')

prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='NetLogo' --exec='/opt/netlogo/bin/NetLogo'
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$pkgname"
    cd "$srcdir/NetLogo $pkgver" || exit
    cp -r ./* "$pkgdir/opt/$pkgname"

    for file in {NetLogo,NetLogo3D,HubNetClient,Behaviorsearch}; do
        chmod +x "$pkgdir/opt/$pkgname/$file"
        ln -s "/opt/$pkgname/bin/$file" "$pkgdir/usr/bin/"
    done
}

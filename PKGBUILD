# Maintainer: Julio Gonzalez <juliolokooo AT gmail DOT com>
# Contributor: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo-beta
_pkgname=netlogo
pkgver=6.0.BETA1
_pkgver=6.0-BETA1
pkgrel=2
pkgdesc="A multi-agent programmable modeling environment. Beta version"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"  ] && _NARCH=32
[ "$CARCH" = "x86_64" ] && _NARCH=64
license=('LGPL' 'custom')
url="http://ccl.northwestern.edu/netlogo/"
depends=('java-environment')
conflicts=('netlogo')
makedepends=('gendesk')
optdepends=('alsa-lib' 'libnet' 'gtk2' 'gcc-libs-multilib')
install=$_pkgname.install
source=(http://ccl.northwestern.edu/netlogo/$_pkgver/NetLogo-$_pkgver-$_NARCH.tgz
        netlogo.png)
md5sums_i686=('57e782a15f1b687f0bf566a74f82fdbe')
md5sums_x86_64=('cf4189a0760219ab5bd3b3b75dabc119')
md5sums=('4ee488fc0c5c07fad84cf1c24e44556d')

prepare() {
    gendesk -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --name='NetLogo' --exec='/opt/netlogo/NetLogo'
	gendesk -n --pkgname "${_pkgname}3D" --pkgdesc "$pkgdesc" --name='NetLogo3D' --exec='/opt/netlogo/NetLogo3D'

}

package() {
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "${_pkgname}3D.desktop" "$pkgdir/usr/share/applications/${_pkgname}3D.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/${_pkgname}3D.png"

    mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$pkgname"
    cd "$srcdir/$pkgname-$pkgver-$_NARCH" || exit
    cp -r ./* "$pkgdir/opt/$pkgname"

    for file in {NetLogo,NetLogo3D,NetLogoLogging,HubNetClient}; do
        chmod +x "$pkgdir/opt/$pkgname/$file"
        ln -s "/opt/$pkgname/$file" "$pkgdir/usr/bin/"
    done
}

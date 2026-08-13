pkgname=paramountplus
_pkgname=ParamountPlus
pkgver=1.0.12
pkgrel=1
pkgdesc="Unnofficial ParamountPlus desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/paramountplus"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('5dc6f97958cf006b6b0ffcfb60f93936aa2b394c0da39594ad87b1ead3242256')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #LibElectron deps cleanup
    rm -rf "$srcdir/application-$pkgver/libsplash"
    rm -rf "$srcdir/application-$pkgver/libadblock"
    rm -rf "$srcdir/application-$pkgver/libuseragent"
    #link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    ln -sf "/opt/libelectron/libadblock" "$srcdir/application-$pkgver/libadblock"
    ln -sf "/opt/libelectron/libuseragent" "$srcdir/application-$pkgver/libuseragent"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/bin/electroncastlab" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

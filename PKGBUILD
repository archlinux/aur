pkgname=disneyplus
_pkgname=DisneyPlus
pkgver=1.1.1
pkgrel=1
pkgdesc="Unnofficial Disney+ desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/disneyplusdesktop/application"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("https://gitlab.com/disneyplusdesktop/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('14c466303be26c362d1e0d2cbeeaf965a351239fb243a8cdd53b8ead9c4d2dfa')


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
    ln -sf "/usr/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

pkgname=tubi
_pkgname=Tubi
pkgver=1.0.9
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Tubi desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/tubidesktop"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('1d9499a744b77c74e4f4333b6926897eb52208f243c3e17faa4ae0d60a2407c7')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #LibElectron deps cleanup
    rm -rf "$srcdir/application-$pkgver/libsplash"
    rm -rf "$srcdir/application-$pkgver/libadblock"
    #link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    ln -sf "/opt/libelectron/libadblock" "$srcdir/application-$pkgver/libadblock"
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    ln -sf "/usr/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

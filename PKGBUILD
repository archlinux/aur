pkgname=stingray
_pkgname=Stingray
pkgver=1.0.7
pkgrel=1
pkgdesc="Custom client for a private Jellyfin server."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/stingray"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git' 'playerctl')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('e66a1b0c5dfe20a417025744f921765e4ecd574452aefe025021c96eb84bbcc9')


package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/bin"

    cd "$srcdir/$pkgname-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$pkgname-$pkgver"
    #Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf "$srcdir/$pkgname-$pkgver/libsplash"
    #link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/$pkgname-$pkgver/libsplash"
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

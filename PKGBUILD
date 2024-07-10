pkgname=googlekeep
_pkgname=GoogleKeep
pkgver=1.0.7
pkgrel=1
pkgdesc="Unnofficial Google Keep desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/googlekeep-desktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'gtk4' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('9ad4af2a300b85533d8b71f26c32ec678d2682f9ff478ce178fe9fcf48b3e0fc')

package() {
    for dir in application-$pkgver; do [ -d "$dir" ] && mv "$dir" "$_pkgname"; done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

pkgname=mewe
_pkgname=Mewe
pkgver=1.0.9
pkgrel=1
pkgdesc="Unofficial Mewe desktop application."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/mewedesktop"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2026.3' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('1f09dc65bcf735f3a7b2f295089fe43528ac2e4983dbf072f538672040bee298')


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/application-$pkgver"
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
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    ln -sf /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

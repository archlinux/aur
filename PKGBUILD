pkgname=10play
_pkgname=10Play
pkgver=1.0.4
pkgrel=1
pkgdesc="Unofficial 10 Play desktop app."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/10play"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2026.4' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('7bf1343bfe8cde7a586b51e6e9c150ac1bb60fdb10903ac2b75cc3aaec1c4a0e')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/application-$pkgver/libsplash"
    #link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/application-$pkgver/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

pkgname=youtubemusic
_pkgname=YoutubeMusic
pkgver=1.0.14
pkgrel=1
pkgdesc="Youtube Music is a unofficial client to play your music."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/youtube-music"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2026.5' 'nss' 'gtk3' 'libxss' 'git' 'playerctl')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('5c42d7d4c201fb92cd05183ee6e3c59ba21eddaed57764b3629f9fa24b2baea7')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    # Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf \
        "$srcdir/application-$pkgver/libsplash" \
        "$srcdir/application-$pkgver/libadblock"
    # Link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    ln -sf "/opt/libelectron/libadblock" "$srcdir/application-$pkgver/libadblock"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

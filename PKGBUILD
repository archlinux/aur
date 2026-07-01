pkgname=tiktok
_pkgname=Tiktok
pkgver=1.0.0
pkgrel=1
pkgdesc="Unnofficial Tiktok desktop application with built in adblocker"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/tiktok"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2026.4' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('0f015533ec87149dff9a9fc3c8bce2f16fd09d031761871b32734f7aabb5ee04')

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/bin"

    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/application-$pkgver/libsplash" \
  "$srcdir/application-$pkgver/libadblock"
    #link libelectron deps
    ln -s "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    ln -s "/opt/libelectron/libadblock" "$srcdir/application-$pkgver/libadblock"
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/tiktok.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

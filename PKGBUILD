pkgname=bluesky
_pkgname=Bluesky
pkgver=1.0.5
pkgrel=1
pkgdesc="Unofficial bluesky desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/bluesky"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.5' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('8abfd8b3e793d1e29721b19bad35fbe7e53117d9a206b495510e54850c8e8353')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

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
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps" 

    # Link to binary
    ln -s /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

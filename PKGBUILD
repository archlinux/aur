pkgname=phoenixbrowser
_pkgname=PhoenixBrowser
pkgver=0.95.1
pkgrel=1
pkgdesc="A light and snappy web browser"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/phoenix/phoenix"
license=('GPL')
depends=('electron-castlab-bin>=v44.5.1' 'libelectron>=2026.6' 'nss' 'gtk3' 'libxss' 'git' 'bitwarden-cli')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/phoenix-$pkgver.tar.bz2")
sha256sums=('955834a482d02920fb9c4ed4a4184d0086c5f7567925bfc55894a153ca059432')

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/phoenix-$pkgver"
    chmod +x "$pkgname"
    ln -sf "/opt/libelectron/node_modules" "$srcdir/phoenix-$pkgver"
    #dep cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/phoenix-$pkgver/libadblock" \
  "$srcdir/phoenix-$pkgver/libuseragent" \
    #link libelectron deps
    ln -sf "/opt/libelectron/libadblock" "$srcdir/phoenix-$pkgver/libadblock"
    ln -sf "/opt/libelectron/libuseragent" "$srcdir/phoenix-$pkgver/libuseragent"

    rm -rf "version.txt"
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/sysicons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"

    # Symlink electron
    ln -sf "/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"

    #Symlink binary
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/phoenix-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

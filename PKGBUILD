pkgbase=phoenixbrowser

if [[ "$CARCH" == "aarch64" ]]; then
    pkgname=(phoenixbrowser phoenixbrowser-aarch64)
else
    pkgname=(phoenixbrowser)
fi

_pkgname=PhoenixBrowser
_binname=phoenixbrowser
pkgver=0.81
pkgrel=1
pkgdesc="A light and snappy web browser"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/phoenix/phoenix"
license=('GPL')
depends=('libelectron>=2026.4' 'nss' 'gtk3' 'libxss' 'git' 'bitwarden-cli')
depends_x86_64=('electron-castlab-bin>=v43.0.0')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/phoenix-$pkgver.tar.bz2")
sha256sums=('e10f0bcbe833b7e2523289ae3e725287d63b5288edb3bbd9d4185b22e50b766e')

_package_common() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/phoenix-$pkgver"
    chmod +x "$_binname"
    ln -sf "/opt/libelectron/node_modules" "$srcdir/phoenix-$pkgver"
    #dep cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/phoenix-$pkgver/libadblock" \
  "$srcdir/phoenix-$pkgver/libuseragent" \
    #link libelectron deps
    ln -sf "/opt/libelectron/libadblock" "$srcdir/phoenix-$pkgver/libadblock"
    ln -sf "/opt/libelectron/libuseragent" "$srcdir/phoenix-$pkgver/libuseragent"

    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/sysicons/icon.svg" "$pkgdir/usr/share/pixmaps/$_binname.svg"

    # Symlink electron
    if [[ "$CARCH" == 'x86_64' ]]; then
        ln -sf "/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"
    else
        ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname/electron"
    fi

    #Symlink binary
    ln -s "/opt/$_pkgname/$_binname" "$pkgdir/usr/bin/$_binname"

    # Desktop Entry
    install -Dm644 "$srcdir/phoenix-$pkgver/$_binname.desktop" \
        "$pkgdir/usr/share/applications/$_binname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_binname.desktop"
}

package_phoenixbrowser() {
    _package_common
}

package_phoenixbrowser-aarch64() {
    pkgdesc="$pkgdesc (ARM64 runtime add-on)"
    depends=('phoenixbrowser' 'libelectron-electron-meta')
}

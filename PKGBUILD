pkgbase=phoenixbrowser

if [[ "$CARCH" == "aarch64" ]]; then
    pkgname=(phoenixbrowser phoenixbrowser-aarch64)
else
    pkgname=(phoenixbrowser)
fi

_pkgname=PhoenixBrowser
_binname=phoenixbrowser
pkgver=0.78
pkgrel=1
pkgdesc="A light and snappy web browser"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/phoenix/phoenix"
license=('GPL')
depends=('libelectron>=2026.3' 'nss' 'gtk3' 'libxss' 'git' 'bitwarden-cli')
depends_x86_64=('electron-castlab-bin')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/phoenix-$pkgver.tar.bz2")
sha256sums=('ef3d4e382337d0beb2b8a0b7fd9ba87c88783edd514b861024f99e07c23d0219')

_package_common() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/phoenix-$pkgver"
    chmod +x "$_binname"
    ln -sf "/opt/libelectron/node_modules" "$srcdir/phoenix-$pkgver"

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

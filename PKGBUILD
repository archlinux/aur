pkgname=phoenixbrowser
_pkgname=PhoenixBrowser
pkgver=0.77
pkgrel=2
pkgdesc="A light and snappy web browser"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/phoenix/phoenix"
license=('GPL')
depends=('libelectron>=2026.3' 'nss' 'gtk3' 'libxss' 'git' 'bitwarden-cli')
depends_x86_64=('electron-castlab-bin')
depends_aarch64=('libelectron-electron-meta')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/phoenix-$pkgver.tar.bz2")
sha256sums=('21e74171dffa87bd34240fa7cdd39b384a9b074a380750ab26b88321b16f6d86')

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/phoenix-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/phoenix-$pkgver"

    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/sysicons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"

    # Symlink electron
    if [[ "$CARCH" == 'x86_64' ]]; then
        ln -sf "/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"
    else
        ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname/electron"
    fi

    #Symlink binary
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/phoenix-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}

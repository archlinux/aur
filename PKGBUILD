pkgname=twitch
_pkgname=Twitch
pkgver=1.0.9
pkgrel=1
pkgdesc="Unofficial Twitch desktop application."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/twitch-application"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2026.3' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('27d0d6a731b37155938bd6e3b9d34f96421474007fcd48370dcd293b7b0165ce')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/application-$pkgver/libsplash"
    #link libelectron deps
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

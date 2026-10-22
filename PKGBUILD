pkgname=twitter
_pkgname=Twitter
pkgver=1.0.9
pkgrel=1
pkgdesc="Unnofficial Twitter desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/twitterdesktop/application"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2026.3' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('2a63f12565914581ab2421c6893c139c76f1c436f7321589a721e689c721950f')


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/application-$pkgver/libsplash" \
  "$srcdir/application-$pkgver/libadblock" \
  "$srcdir/application-$pkgver/libuseragent"
    #link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    ln -sf "/opt/libelectron/libadblock" "$srcdir/application-$pkgver/libadblock"
    ln -sf "/opt/libelectron/libuseragent" "$srcdir/application-$pkgver/libuseragent"
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname-icon.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    ln -sf "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

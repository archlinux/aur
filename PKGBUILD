pkgname=tabracing
_pkgname=TAB
pkgver=1.0.4
pkgrel=1
pkgdesc="Unofficial TAB Australia desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/tab/"
license=('GPL')
depends=('libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('7bf5033530a8b5ed478ef025cbfd1a493a71a624c93d74e440ee1ff5f3841182')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x tabracing
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    #Libsplash/LibAdblock lib cleanup to use LibElectron deps instead
    rm -rf \
  "$srcdir/application-$pkgver/libsplash"
    #link libelectron deps
    ln -sf "/opt/libelectron/libsplash" "$srcdir/application-$pkgver/libsplash"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/application-$pkgver/tabracing.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/$_pkgname/tabracing" "$pkgdir/usr/bin/tabracing"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/tab.desktop" \
        "$pkgdir/usr/share/applications/tab.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/tab.desktop"
}

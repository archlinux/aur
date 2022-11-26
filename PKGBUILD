pkgname=paramountplus
_pkgname=ParamountPlus
pkgver=1.0.2
pkgrel=2
pkgdesc="Unnofficial ParamountPlus desktop application"
arch=('x86_64')
url="https://gitlab.com/ParamountPlus-desktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("ParamountPlus-bin")
source=("https://gitlab.com/paramountplus/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('a1eab14be40274621d184ac15bda4308746b4059bd04aa9ea4e59d201bf4e7b2')

package() {
    for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    cat <<EOT >> $pkgname
    #!/bin/bash
    cd /opt/$_pkgname &&
    npm start
EOT

    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
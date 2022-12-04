pkgname=stan-desktop
_pkgname=Stan-desktop
pkgrlname=stan
_pkgrlname=Stan
pkgver=1.0.2
pkgrel=1
pkgdesc="Unnofficial Stan desktop application"
arch=('x86_64')
url="https://gitlab.com/Stan-desktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("Stan-bin")
source=("https://gitlab.com/Stan-desktop/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('1652ba34a5ffc1bb7aa2e1587cbb9422056ba1d7813bac2d3af2e379fd2d4839')

package() {
    for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgrlname" ;done
    cd "$srcdir/$_pkgrlname"
    cat <<EOT >> $pkgrlname
    #!/bin/bash
    cd /opt/$_pkgrlname &&
    npm start
EOT

    chmod +x $pkgrlname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgrlname"
    install -dm755 "$pkgdir/opt/$_pkgrlname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgrlname"
    cp -r "$pkgdir/opt/$_pkgrlname/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgrlname/$pkgrlname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgrlname/$_pkgrlname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgrlname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgrlname.desktop"
}

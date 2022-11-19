pkgname=foxtelgo
_pkgname=FoxtelGo
pkgver=1.0.6
pkgrel=1
pkgdesc="Unnofficial FoxtelGo desktop application"
arch=('x86_64')
url="https://gitlab.com/foxtelgo/application"
license=('GPL')
conflicts=("foxtelgo-bin")
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("git+https://gitlab.com/foxtelgo/application.git")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    cat <<EOT >> foxtelgo
    #!/bin/bash
    cd /opt/FoxtelGo &&
    npm start
EOT

    chmod +x foxtelgo
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/FoxtelGo"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/FoxtelGo"
    cp -r "$pkgdir/opt/FoxtelGo/foxtelgo.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/FoxtelGo/foxtelgo" "$pkgdir/usr/bin/foxtelgo"

    # Desktop Entry
    install -Dm644 "$srcdir/application/FoxtelGo.desktop" \
        "$pkgdir/usr/share/applications/FoxtelGo.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/FoxtelGo.desktop"
}
pkgname=binge
_pkgname=Binge
pkgver=1.0.3
pkgrel=2
pkgdesc="Unnofficial Binge desktop application"
arch=('x86_64')
url="https://gitlab.com/binge-desktop/application"
license=('GPL')
conflicts=("binge-bin")
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("git+https://gitlab.com/binge-desktop/application.git")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    cat <<EOT >> Binge
    #!/bin/bash
    cd /opt/Binge &&
    npm start
EOT

    chmod +x Binge
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/Binge"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Binge"
    cp -r "$pkgdir/opt/Binge/binge.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Binge/Binge" "$pkgdir/usr/bin/Binge"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Binge.desktop" \
        "$pkgdir/usr/share/applications/Binge.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Binge.desktop"
}
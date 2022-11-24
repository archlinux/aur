pkgname=netflix
_pkgname=Netflix
pkgver=1.0.5
pkgrel=2
pkgdesc="Unnofficial Netflix desktop application"
arch=('x86_64')
url="https://gitlab.com/netflix-desktop/application.git"
license=('GPL')
conflicts=("Netflix-bin")
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("git+https://gitlab.com/netflix-desktop/application.git")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    cat <<EOT >> netflix
    #!/bin/bash
    cd /opt/Netflix &&
    npm start
EOT

    chmod +x netflix
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/Netflix"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Netflix"
    cp -r "$pkgdir/opt/Netflix/netflix.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Netflix/netflix" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Netflix.desktop" \
        "$pkgdir/usr/share/applications/Netflix.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Netflix.desktop"
}
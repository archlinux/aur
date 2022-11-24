pkgname=googlekeep
_pkgname=GoogleKeep
pkgver=1.0.3
pkgrel=3
pkgdesc="Unnofficial Google Keep desktop application"
arch=('any')
url="https://gitlab.com/googlekeep-desktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("googlekeep-bin")
source=("git+https://gitlab.com/googlekeep-desktop/application")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    rm -rf .git
    cat <<EOT >> googlekeep
    #!/bin/bash
    cd /opt/GoogleKeep &&
    npm start
EOT

    chmod +x googlekeep
    ln -s "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/GoogleKeep"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/GoogleKeep"
    cp -r "$pkgdir/opt/GoogleKeep/googlekeep.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/GoogleKeep/googlekeep" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/application/GoogleKeep.desktop" \
        "$pkgdir/usr/share/applications/GoogleKeep.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/GoogleKeep.desktop"
}

pkgname=disneyplus
_pkgname=DisneyPlus
pkgver=1.0.3
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Disney+ desktop application"
arch=('x86_64')
url="https://gitlab.com/disneyplusdesktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("disneyplus-git" "disneyplus-bin")
source=("git+https://gitlab.com/disneyplusdesktop/application")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    rm -rf .git
    cat <<EOT >> disneyplus
    #!/bin/bash
    cd /opt/DisneyPlus &&
    npm start
EOT

    chmod +x disneyplus
    ln -s "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/DisneyPlus"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/DisneyPlus"
    cp -r "$pkgdir/opt/DisneyPlus/disneyplus.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/DisneyPlus/disneyplus" "$pkgdir/usr/bin/disneyplus"

    # Desktop Entry
    install -Dm644 "$srcdir/application/DisneyPlus.desktop" \
        "$pkgdir/usr/share/applications/DisneyPlus.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/DisneyPlus.desktop"
}
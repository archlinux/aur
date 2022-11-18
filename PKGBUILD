pkgname=youtube
_pkgname=Youtube
pkgver=1.0.8
pkgrel=1
pkgdesc="Unnofficial Youtube desktop application"
arch=('any')
url="https://gitlab.com/youtube-desktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("youtube-git" "youtube-bin")
source=("git+https://gitlab.com/youtube-desktop/application")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    rm -rf .git
    cat <<EOT >> Youtube
    #!/bin/bash
    cd /opt/Youtube &&
    npm start
EOT

    chmod +x Youtube
    ln -s "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/Youtube"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Youtube"
    cp -r "$pkgdir/opt/Youtube/youtubeapp.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Youtube/Youtube" "$pkgdir/usr/bin/Youtube"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Youtube.desktop" \
        "$pkgdir/usr/share/applications/Youtube.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Youtube.desktop"
}

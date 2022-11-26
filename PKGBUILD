pkgname=youtubemusic
_pkgname=YoutubeMusic
pkgver=1.0.5
pkgrel=1
pkgdesc="Youtube Music is a unofficial client to play your music."
arch=('any')
url="https://gitlab.com/youtube-music/application"
license=('GPL')
conflicts=("youtube-bin")
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("https://gitlab.com/youtube-music/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')


package() {
    for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    cat <<EOT >> $_pkgname
    #!/bin/bash
    cd /opt/$_pkgname &&
    npm start
EOT

    chmod +x $_pkgname
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
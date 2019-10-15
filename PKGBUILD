# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=osu-mime
pkgdesc='Provides MIME types for osu! file formats'
pkgver=0.1
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(xdg-utils shared-mime-info desktop-file-utils)
makedepends=(librsvg imagemagick)
optdepends=('osu-handler: to open osu! files in a running osu! instance')
install='osu-mime.install'
source=(https://raw.githubusercontent.com/ppy/osu-web/master/public/images/layout/osu-logo-triangles.svg
        https://raw.githubusercontent.com/ppy/osu-web/master/public/images/layout/osu-logo-white.svg
        osu-file-extensions.xml)
sha256sums=('e1aeaf9b81fa88e9b2b32d7f7c357a3f27c88df775fc19c1e4b65add9da7a1af'
            '5ef601206caf4d37cc028ccc3fd826af7b9810968c72f31a233c0eed920bae46'
            '53235dddeadccad6a09eb251eac6357813a08440eb03e5410cdb470eba78b65f')

build() {
    cd "$srcdir"

    mkdir -p 'icons/hicolor'
    for size in 16 24 32 48 64 96 128 192 256 384 512 1024; do
        mkdir -p "icons/hicolor/${size}x${size}/apps"
        cd "icons/hicolor/${size}x${size}/apps"

        rsvg-convert -w "$size" -h "$size" -f png -o "osu!.png.1" "$srcdir/osu-logo-triangles.svg"
        rsvg-convert -w "$size" -h "$size" -f png -o "osu!.png.2" "$srcdir/osu-logo-white.svg"
        convert -composite 'osu!.png.1' 'osu!.png.2' -gravity center 'osu!.png'
        rm 'osu!.png.1' 'osu!.png.2'

        cd ../../../..
    done
}

package() {
    cd "$pkgdir"

    mkdir -p usr/share
    cp -r --no-preserve=ownership "$srcdir/icons" 'usr/share/icons'
    install -D -m644 "$srcdir/osu-file-extensions.xml" 'usr/share/mime/packages/osu-file-extensions.xml'
}

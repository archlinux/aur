# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>

pkgname=redeclipse-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="free, casual arena shooter"
arch=(i686 x86_64)
url="http://redeclipse.net"
license=("ZLIB" "CCPL:by-sa" "CCPL:by" "custom")
depends=(sdl2_image sdl2_mixer enet hicolor-icon-theme)
makedepends=(icoutils)
provides=('redeclipse')
conflicts=('redeclipse')
source=("https://github.com/red-eclipse/base/releases/download/v$pkgver/redeclipse_${pkgver}_nix.tar.bz2"
        "redeclipse.desktop")
sha256sums=('48a947e858587116b7d177cf18148d0d9e40b1c5b481e2c955baed68cffc2849'
            '8bfccdd79fc24e923bc1fa3f120cc567e6eb841eaeeb4dc2628682a936465ed5')

prepare() {
    cd "redeclipse-$pkgver"
    mkdir -p cache
}

package() {
    install -Dm 0644 "redeclipse.desktop" "$pkgdir/usr/share/applications/redeclipse.desktop"
    cd "redeclipse-$pkgver"
    echo "stable" > branch.txt
    REDECLIPSE_CACHE="$(realpath ./cache)" bin/update.sh
    find bin -name '*.dll' -delete
    find bin -name '*.exe' -delete
    rm -r bin/redeclipse.app
    rm -r bin/tools
    rm bin/update.bat
    cd src
    icotool -x redeclipse.ico
    cd ..

    install -Dm 0644 "doc/license.txt" "$pkgdir/usr/share/licenses/redeclipse/license.txt"
    install -Dm 0644 "doc/all-licenses.txt" "$pkgdir/usr/share/licenses/redeclipse/all-licenses.txt"
    install -Dm 0644 "src/redeclipse_8_512x512x32.png" "$pkgdir/usr/share/pixmaps/redeclipse.png"
    mkdir -p "$pkgdir/opt/redeclipse"
    cp -r "bin" "$pkgdir/opt/redeclipse"
    cp -r  "config" "$pkgdir/opt/redeclipse"
    cp -r  "data" "$pkgdir/opt/redeclipse"
    install -Dm 0755 "redeclipse.sh" "$pkgdir/opt/redeclipse"
    install -Dm 0755 "redeclipse_server.sh" "$pkgdir/opt/redeclipse"
    echo "inplace" > "$pkgdir/opt/redeclipse/branch.txt"
}

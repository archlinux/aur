# Maintainer: Andrew Relative <kezin636 at gmail dot com>

pkgname=aegnux
pkgver=0.3.1
pkgrel=2
pkgdesc="A convenient way to install Adobe After Effects on Linux using Wine."
arch=('x86_64')
url="https://github.com/relativemodder/aegnux"
license=('GPL-3.0-only')
depends=('pyside6' 'python-requests' 'cabextract' 'winetricks')
makedepends=('curl' 'tar' 'unzip' 'libarchive' 'zip')
checkdepends=()
optdepends=('kitty')
backup=()
options=(!strip)
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/relativemodder/aegnux/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    rootdir="$srcdir/${pkgname}-${pkgver}"
    cd "$rootdir"
    sed -i '3,27d' "$rootdir/prepare.sh" # removing bloat
    ./prepare.sh

    cp /usr/bin/cabextract "$rootdir/bin/"
    cp /usr/bin/winetricks "$rootdir/bin/"

    rm -rf "$rootdir/assets/wine/include"

    sed -i "s|\['./bin/kitty/bin/kitty', 'bash'\]|['kitty']|g" $rootdir/src/mainwindow.py

    rm $rootdir/run.sh
    cp ../../run.sh $rootdir/
    chmod +x $rootdir/run.sh
}

package() {
    rootdir="$srcdir/${pkgname}-${pkgver}"
    cd $rootdir
    mkdir -p "$pkgdir/opt/aegnux"

    cp -r $rootdir/* "$pkgdir/opt/aegnux/"
    install -Dm644 "$rootdir/icons/aegnux.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.relative.Aegnux.png"
    cd ../..
    install -Dm644 com.relative.Aegnux.desktop "$pkgdir/usr/share/applications/com.relative.Aegnux.desktop"
    install -Dm644 aegnux-misterhorse-handler.desktop "$pkgdir/usr/share/applications/aegnux-misterhorse-handler.desktop"
    install -Dm644 application-vnd.adobe.aftereffects.project.xml "$pkgdir/usr/share/mime/packages/application-vnd.adobe.aftereffects.project.xml"
}
# Maintainer: Chris Sculley <cs.sculley at gmail dot com>
pkgname=idena-desktop-git
pkgver=v0.0.10.r233.g647bc41
pkgrel=2
pkgdesc="The idena-desktop application for the Idena network"
arch=("x86_64")
url="https://github.com/idena-network/idena-desktop"
# license=("")
makedepends=("git" "npm")
depends=("electron" "libappindicator-gtk3" "libnotify")
provides=("idena-desktop")
conflicts=("idena-desktop")
source=("$pkgname::git+https://github.com/idena-network/idena-desktop.git"
        "idena-desktop.desktop")
md5sums=("SKIP"
        "cdabc45c6384a61d81b76a6f2d9bdeb2")

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$pkgname"
    
    # use system electron version
    # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
    _electronDist=$(dirname $(realpath $(which electron)))
    _electronVer=$(electron --version | tail -c +2)
    # sed -i '/		"electron": /d' ./package.json
    HOME="$srcdir/$pkgname/.electron-gyp" npm install --cache "$srcdir/$pkgname/npm-cache"
    npm run build && ./node_modules/.bin/electron-builder --linux --x64 --dir dist -c.electronDist=$_electronDist -c.electronVersion=$_electronVer
}

package() {
    cd "$srcdir/$pkgname"
    
    install -Dm644 main/static/icon-512.png "$pkgdir/usr/share/pixmaps/idena-desktop.png"
   
    mkdir -m755 "$pkgdir"/{opt,usr/bin} 
    cp -a dist/linux-unpacked "$pkgdir/opt/idena-desktop"
    ln -s /opt/idena-desktop/idena-desktop "$pkgdir/usr/bin/idena-desktop"
    
    install -Dm644 "$srcdir/idena-desktop.desktop" -t "$pkgdir/usr/share/applications"
    # install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
 

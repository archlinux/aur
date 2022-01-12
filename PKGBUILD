pkgname=foxtelgo-git
_pkgname=FoxtelGO-git
pkgver=1.0.3
pkgrel=1
pkgdesc="Unofficial Foxtel Go desktop app."
arch=('x86_64')
url="https://gitlab.com/foxtelgo/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("FoxtelGO-bin")
source=(git+https://gitlab.com/foxtelgo/application.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm install "https://github.com/castlabs/electron-releases#v13.6.6-wvvmp" --save-dev
    npm --cache "$srcdir/npm-cache" i electron-context-menu@3.1.1
}

package() {
    cd "$srcdir/application"
    install -dm755 "$pkgdir/opt/FoxtelGO"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/FoxtelGO"
    cp -r "$pkgdir/opt/FoxtelGO/foxtelgo.svg" "$pkgdir/usr/share/pixmaps"    

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/FoxtelGO/foxtelgo" "$pkgdir/usr/bin/foxtelgo"

    # Desktop Entry
    install -Dm644 "$srcdir/application/FoxtelGO.desktop" \
        "$pkgdir/usr/share/applications/FoxtelGO.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/FoxtelGO.desktop"
}

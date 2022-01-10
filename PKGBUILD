pkgname=binge-git
_pkgname=Binge-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial Binge desktop app."
arch=('x86_64')
url="https://gitlab.com/binge-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("Binge-bin")
source=(git+https://gitlab.com/binge-desktop/application)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm install "https://github.com/castlabs/electron-releases#v14.2.2-wvvmp" --save-dev
    npm --cache "$srcdir/npm-cache" i electron-context-menu@3.1.1
}

package() {
    cd "$srcdir/application"
    install -dm755 "$pkgdir/opt/Binge"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    cp -r ./ "$pkgdir/opt/Binge"
    cp -r "$pkgdir/opt/Binge/binge.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Binge/binge" "$pkgdir/usr/bin/binge"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Binge.desktop" \
        "$pkgdir/usr/share/applications/Binge.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Binge.desktop"
}

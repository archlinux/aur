pkgname=youtube-git
_pkgname=Youtube-git
pkgver=e0b75da6
pkgrel=3
pkgdesc="Unnofficial Youtube desktop application"
arch=('any')
url="https://gitlab.com/youtube-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("youtube-bin")
source=(git+https://gitlab.com/youtube-desktop/application.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron electron-context-menu electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in Youtube-linux-*/ ; do mv "${dir}" "Youtube" ;done
}

package() {
    cd "$srcdir/application/Youtube"
    install -dm755 "$pkgdir/opt/Youtube"
    cp -r ./ "$pkgdir/opt/Youtube"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    cp -r ./ "$pkgdir/opt/Youtube"
    cp -r "$pkgdir/opt/Youtube/youtube.svg" "$pkgdir/usr/share/pixmaps"    

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/Youtube" "$pkgdir/usr/bin/Youtube"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Youtube.desktop" \
        "$pkgdir/usr/share/applications/Youtube.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Youtube.desktop"
}

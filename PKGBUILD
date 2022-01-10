pkgname=googlekeep-git
_pkgname=GoogleKeep-git
pkgver=1.0.2
pkgrel=2
pkgdesc="Unofficial Google Keep desktop application."
arch=('any')
url="https://gitlab.com/GoogleKeep-application/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("GoogleKeep-bin")
source=('git+https://gitlab.com/googlekeep-desktop/application.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron electron-context-menu electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in GoogleKeep-linux-*/ ; do mv "${dir}" "GoogleKeep" ;done
}

package() {
    cd "$srcdir/application/GoogleKeep"
    install -dm755 "$pkgdir/opt/GoogleKeep"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/GoogleKeep"
    cp -r "$pkgdir/opt/Youtube/resources/app/googlekeep.svg" "$pkgdir/usr/share/pixmaps"     

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/GoogleKeep/GoogleKeep" "$pkgdir/usr/bin/googlekeep"

    # Desktop Entry
    install -Dm644 "$srcdir/application/GoogleKeep.desktop" \
        "$pkgdir/usr/share/applications/GoogleKeep.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/GoogleKeep.desktop"
}

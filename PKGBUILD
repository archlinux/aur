pkgname=googlekeep-git
_pkgname=GoogleKeep-git
pkgver=1.0.1
pkgrel=1
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
    npm --cache "$srcdir/npm-cache" i electron@13.1.4 electron-context-menu@3.1.1 electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in GoogleKeep-linux-*/ ; do mv "${dir}" "GoogleKeep" ;done
}

package() {
    cd "$srcdir/application/GoogleKeep"
    install -dm755 "$pkgdir/opt/GoogleKeep"
    cp -r ./ "$pkgdir/opt/GoogleKeep"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/GoogleKeep" "$pkgdir/usr/bin/GoogleKeep"

    # Desktop Entry
    install -Dm644 "$srcdir/application/GoogleKeep.desktop" \
        "$pkgdir/usr/share/applications/GoogleKeep.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/GoogleKeep.desktop"
}

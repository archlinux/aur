pkgname=gamerworld-git
_pkgname=GamerWorld-git
pkgver=1.2.0
pkgrel=7
pkgdesc="Play games all in one place"
arch=('any')
url="https://gitlab.com/gamerworld/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("gamerworld-bin")
source=('git+https://gitlab.com/gamerworld/application.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron@12.0.0 jquery electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in GamerWorld-linux-*/ ; do mv "${dir}" "GamerWorld" ;done
}

package() {
    cd "$srcdir/application/GamerWorld"
    install -dm755 "$pkgdir/opt/GamerWorld"
    cp -r ./ "$pkgdir/opt/GamerWorld"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/GamerWorld" "$pkgdir/usr/bin/GamerWorld"

    # Desktop Entry
    install -Dm644 "$srcdir/application/GamerWorld.desktop" \
        "$pkgdir/usr/share/applications/GamerWorld.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/GamerWorld.desktop"
}

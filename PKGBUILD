pkgname=messages-git
_pkgname=Messages-git
pkgver=1.0.2
pkgrel=2
pkgdesc="Unnofficial messages desktop app."
arch=('any')
url="https://gitlab.com/androidmessages/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("Messages-bin")
source=('git+https://gitlab.com/androidmessages/application.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron@13.1.7 electron-context-menu@3.1.1 electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in Messages-linux-*/ ; do mv "${dir}" "Messages" ;done
}

package() {
    cd "$srcdir/application/Messages"
    install -dm755 "$pkgdir/opt/Messages"
    cp -r ./ "$pkgdir/opt/Messages"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/Messages" "$pkgdir/usr/bin/Messages"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Messages.desktop" \
        "$pkgdir/usr/share/applications/Messages.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Messages.desktop"
}

pkgname=twitch-git
_pkgname=Twitch-git
pkgver=1.0.3
pkgrel=1
pkgdesc="Unofficial Twitch desktop application."
arch=('any')
url="https://gitlab.com/twitch-application/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("Twitch-bin")
source=('git+https://gitlab.com/twitch-application/application.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron@12.0.0 electron-context-menu2.5.0 electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in Twitch-linux-*/ ; do mv "${dir}" "Twitch" ;done
    rm -rf "$srcdir/application/Twitch/resources/app/node_modules"
}

package() {
    cd "$srcdir/application/Twitch"
    install -dm755 "$pkgdir/opt/Twitch"
    cp -r ./ "$pkgdir/opt/Twitch"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/Twitch" "$pkgdir/usr/bin/Twitch"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Twitch.desktop" \
        "$pkgdir/usr/share/applications/Twitch.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Twitch.desktop"
}

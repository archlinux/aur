pkgname=twitch-git
_pkgname=Twitch-git
pkgver=1.0.4
pkgrel=4
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
    npm --cache "$srcdir/npm-cache" i electron electron-context-menu electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in Twitch-linux-*/ ; do mv "${dir}" "Twitch" ;done
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

pkgname=twitch
_pkgname=Twitch
pkgver=1.0.1
pkgrel=1
pkgdesc="Unofficial Twitch desktop application."
arch=('x86_64')
url="https://gitlab.com/coreybruce/twitch-desktop"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=('git+https://gitlab.com/coreybruce/twitch-desktop.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname-desktop"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/$pkgname-desktop"
    npm --cache "$srcdir/npm-cache" i electron electron-packager
    ./node_modules/.bin/electron-packager . --overwrite
    rm -rf "$srcdir/$pkgname/$_pkgname-linux-x64/resources/app/node_modules"
}

package() {
    cd "$srcdir/$pkgname-desktop/$_pkgname-linux-x64"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r ./ "$pkgdir/opt/$_pkgname"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/${pkgname%}"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-desktop/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

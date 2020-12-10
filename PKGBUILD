pkgname=youtube
_pkgname=Youtube
pkgver=1.0.4
pkgrel=1
pkgdesc="Unnofficial Youtube desktop application"
arch=('any')
url="https://gitlab.com/youtube-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=(git+https://gitlab.com/youtube-desktop/application.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron@11.0.4 electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in $_pkgname-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    rm -rf "$srcdir/$pkgname/$_pkgname/resources/app/node_modules"
}

package() {
    cd "$srcdir/application/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r ./ "$pkgdir/opt/$_pkgname"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/${pkgname%}"

    # Desktop Entry
    install -Dm644 "$srcdir/application/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

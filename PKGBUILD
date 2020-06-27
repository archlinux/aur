pkgname=youtube		
_pkgname=Youtube
pkgver=1.0.2
pkgrel=1
pkgdesc="Unnofficial Youtube desktop application"
arch=('x86_64')
url="https://gitlab.com/coreybruce/youtube"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=(git+https://gitlab.com/coreybruce/youtube.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/youtube"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/youtube"
    npm --cache "$srcdir/npm-cache" i electron electron-packager
    ./node_modules/.bin/electron-packager . --overwrite
    rm -rf "$srcdir/$pkgname/$_pkgname-linux-x64/resources/app/node_modules"
}

package() {
    cd "$srcdir/$pkgname/$_pkgname-linux-x64"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r ./ "$pkgdir/opt/$_pkgname"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/${pkgname%}"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

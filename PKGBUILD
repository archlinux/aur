pkgname=googleduo-git
_pkgname=GoogleDuo-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Unnofficial GoogleDuo desktop application"
arch=('any')
url="https://gitlab.com/google-duo/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("googleduo-bin")
source=(git+https://gitlab.com/google-duo/application.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron@11.0.4 electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in GoogleDuo-linux-*/ ; do mv "${dir}" "GoogleDuo" ;done
    rm -rf "$srcdir/application/GoogleDuo/resources/app/node_modules"
}

package() {
    cd "$srcdir/application/GoogleDuo"
    install -dm755 "$pkgdir/opt/GoogleDuo"
    cp -r ./ "$pkgdir/opt/GoogleDuo"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/GoogleDuo" "$pkgdir/usr/bin/GoogleDuo"

    # Desktop Entry
    install -Dm644 "$srcdir/application/GoogleDuo.desktop" \
        "$pkgdir/usr/share/applications/GoogleDuo.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/GoogleDuo.desktop"
}

# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=quassel-webserver-git
pkgver=2.2.8.r1.g4d8031e
pkgrel=1
pkgdesc="A web client for Quassel (requires a running quasselcore)"
arch=('i686' 'x86_64')
url="https://github.com/magne4000/quassel-webserver"
license=('MIT')
source=("${pkgname%-git}::git+https://github.com/magne4000/quassel-webserver.git"
        "${pkgname%-git}.service")
depends=('nodejs')
makedepends=('npm')
sha256sums=('SKIP'
            '2dab6d8506790ab08ea033e9b2de98884483ea79a5a8016f4af79281240614e0')
install=$pkgname.install
backup=("usr/share/webapps/${pkgname%-git}/settings-user.js")


pkgver() {
    cd "${pkgname%-git}"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $srcdir/${pkgname%-git}
    msg 'Fetching NPM dependencies...'
    npm install --production

    install -Dm644 "$srcdir/${pkgname%-git}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-git}.service"

    mkdir -p "$pkgdir/usr/share/webapps/${pkgname%-git}"
    for _directory in bin lib node_modules public routes ssl views; do
        cp -dpr --no-preserve=ownership $_directory "$pkgdir/usr/share/webapps/${pkgname%-git}/$_directory"
    done

    install -Dm644 app.js settings.js package.json snapcraft.yaml -t "$pkgdir/usr/share/webapps/${pkgname%-git}"
    install -Dm644 settings.js "$pkgdir/usr/share/webapps/${pkgname%-git}/settings-user.js"
}

# Maintainer: Catty Steve <cattysteve89265@163.com>

pkgname=zero-ui
pkgver=r227.076b496
pkgrel=2
pkgdesc='Zerotier Controller UI'
arch=('x86_64')
url='https://github.com/dec0dOS/zero-ui'
license=('GPL')
depends=('nodejs')
makedepends=('yarn')
source=("zero-ui"::'git+https://github.com/dec0dOS/zero-ui'
        zero-ui.service)
sha256sums=('SKIP'
            '5b0146984590a775c8172f9b396e5dc6a9fec8f9394b0978adce00ee5c4da826')
options=("!strip")

pkgver() {
    cd "$srcdir/zero-ui"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/zero-ui"
    mkdir -p app/frontend
    mkdir -p app/backend
    cp yarn.lock .yarnrc.yml app/frontend
    cp -r .yarn  app/frontend/.yarn
    cp ./frontend/package*.json app/frontend
    cd "app/frontend"
    yarn install
    cd "$srcdir/zero-ui"
    cp -r frontend app/
    cd "app/frontend"
    yarn build --verbose
    cd "$srcdir/zero-ui"
    cp yarn.lock .yarnrc.yml app/backend
    cp -r .yarn  app/backend/.yarn
    cp ./backend/package*.json app/backend
    cd "app/backend"
    yarn install
    cd "$srcdir/zero-ui"
    cp -r backend app/
}

package() {
    mkdir -p "$pkgdir/usr/share/webapps/zero-ui"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp -r "$srcdir/zero-ui/app/frontend/build" "$pkgdir/usr/share/webapps/zero-ui/app"
    cp -r "$srcdir/zero-ui/app/backend" "$pkgdir/usr/share/webapps/zero-ui"
    cp "$srcdir/zero-ui.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim:set sts=4 sw=4 et:

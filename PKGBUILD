# Maintainer: Catty Steve <cattysteve89265@163.com>

pkgname=zero-ui
pkgver=r227.076b496
pkgrel=4
pkgdesc='Zerotier Controller UI'
arch=('x86_64')
url='https://github.com/dec0dOS/zero-ui'
license=('GPL')
depends=('nodejs' 'zerotier-one')
makedepends=('yarn')
source=("zero-ui"::'git+https://github.com/dec0dOS/zero-ui'
        zero-ui.service
        zero-ui.conf)
sha256sums=('SKIP'
            '6484332f98a15a24c186839e68de3182ba119169ab789fcfcac0615a2de1d682'
            'e7cdf0f4959f3e582ac67ff564fe7939c584103699bcb97c499f1ae1988fde88')

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
    mkdir -p "$pkgdir/usr/share/webapps/zero-ui/frontend"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/etc"
    cp -r "$srcdir/zero-ui/app/frontend/build" "$pkgdir/usr/share/webapps/zero-ui/frontend/build"
    cp -r "$srcdir/zero-ui/app/backend" "$pkgdir/usr/share/webapps/zero-ui/backend"
    cp "$srcdir/zero-ui.service" "$pkgdir/usr/lib/systemd/system/"
    cp "$srcdir/zero-ui.conf" "$pkgdir/etc/zero-ui.conf"
}

# vim:set sts=4 sw=4 et:

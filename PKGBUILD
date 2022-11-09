# Maintainer: Catty Steve <cattysteve89265@163.com>

pkgname=zero-ui
pkgver=r227.076b496
pkgrel=5
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
            '2ac38719a0a7f792cfeb387f15ee3dfa6f621faf5cf7bf04f019e72165b7d2a0'
            'e0534833f2eb8ecb56c2b9bbb4c09fc315b065c0c67b298d2dc13f116ce7f57a')

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

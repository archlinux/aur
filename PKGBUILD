# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel-git
pkgver=r218.4ca50a9
pkgrel=1
pkgdesc='A control panel that is written in Golang and is able to manage Caddy 2'
arch=('x86_64')
license=('GPLv3')
url='https://gitlab.com/xiayesuifeng/gopanel'
backup=('etc/gopanel/config.json')
depends=('caddy')
makedepends=('go' 'npm' 'goreleaser')
source=("git+https://gitlab.com/xiayesuifeng/gopanel")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/gopanel
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/gopanel
  git submodule update --init
  sed -i '/task web/d' .goreleaser.yaml
}

build() {
  cd ${srcdir}/gopanel
  cd web
  npm install
  npm run build
  cd ..
  goreleaser build --single-target -o ./gopanel --clean --snapshot
}

package() {
  cd ${srcdir}/gopanel
  install -d "$pkgdir/etc/gopanel/app.conf.d"
  install -d "$pkgdir/var/lib/gopanel"
  install -D -m 0755 gopanel "$pkgdir/usr/bin/gopanel"
  install -D -m 0644 contrib/systemd/gopanel.service "$pkgdir/usr/lib/systemd/system/gopanel.service"
}

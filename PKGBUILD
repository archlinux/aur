# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel-git
pkgver=r77.faf9c19
pkgrel=1
pkgdesc='A control panel that is written in Golang and is able to manage Caddy 2'
arch=('x86_64')
license=('GPLv3')
url='https://gitlab.com/xiayesuifeng/gopanel'
backup=('etc/gopanel/config.json')
depends=('caddy2')
makedepends=('go' 'npm')
source=("git+https://gitlab.com/xiayesuifeng/gopanel"
        "git+https://gitlab.com/xiayesuifeng/gopanel-web")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${srcdir}/gopanel
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/gopanel-web
  npm install
  npm run build
  cd ${srcdir}/gopanel
  go build -v
}

package() {
  cd ${srcdir}/gopanel

  mkdir -p "$pkgdir/etc/gopanel/app.conf.d"
  mkdir -p "$pkgdir/usr/share/gopanel/web"
  install -D -m 0755 gopanel "$pkgdir/usr/bin/gopanel"
  install -D -m 0644 systemd/gopanel.service "$pkgdir/usr/lib/systemd/system/gopanel.service"
  install -D -m 0644 config.default.json "$pkgdir/etc/gopanel/config.json"
  cp -rf ${srcdir}/gopanel-web/build "${pkgdir}/usr/share/gopanel/web"
  chmod -R 0644 "${pkgdir}/usr/share/gopanel/web"
}

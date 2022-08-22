# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel
pkgver=0.2.1
pkgrel=1
pkgdesc='A control panel that is written in Golang and is able to manage Caddy 2'
arch=('x86_64')
license=('GPLv3')
url='https://gitlab.com/xiayesuifeng/gopanel'
backup=('etc/gopanel/config.json')
depends=('caddy')
makedepends=('go' 'npm')
source=("https://gitlab.com/xiayesuifeng/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://gitlab.com/xiayesuifeng/${pkgname}-web/-/archive/${pkgver}/${pkgname}-web-${pkgver}.tar.gz")
sha256sums=('e92228570e2b4cb17a27c3366580cfdf036f5f7ee08c8e4f96f2f086c6b2b23b'
            'f926091727f428aaebb8fa0cc6d0c87fab888a65d2c360ddeb541ae793e2df7f')

build() {
  cd ${srcdir}/gopanel-web-${pkgver}
  npm install
  npm run build

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-s -w -mod=readonly -modcacherw"
  cd ${srcdir}/${pkgname}-${pkgver}
  go build -v
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d "$pkgdir/etc/gopanel/app.conf.d"
  install -d "$pkgdir/usr/share/gopanel"
  install -D -m 0755 gopanel "$pkgdir/usr/bin/gopanel"
  install -D -m 0644 systemd/gopanel.service "$pkgdir/usr/lib/systemd/system/gopanel.service"
  install -D -m 0644 config.default.json "$pkgdir/etc/gopanel/config.json"
  sed -i 's|http://localhost:2019|unix//run/caddy/admin.socket|g' "$pkgdir/etc/gopanel/config.json"
  cp -rf ${srcdir}/gopanel-web-${pkgver}/build "${pkgdir}/usr/share/gopanel/web"
  chmod -R 0644 "${pkgdir}/usr/share/gopanel/web"
}

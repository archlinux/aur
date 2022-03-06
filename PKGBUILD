# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel
pkgver=0.1.0
pkgrel=1
pkgdesc='A control panel that is written in Golang and is able to manage Caddy 2'
arch=('x86_64')
license=('GPLv3')
url='https://gitlab.com/xiayesuifeng/gopanel'
backup=('etc/gopanel/config.json')
depends=('caddy')
makedepends=('go' 'npm')
source=("https://gitlab.com/xiayesuifeng/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "gopanel-web.tar.gz::https://gitlab.com/xiayesuifeng/${pkgname}-web/-/archive/master/gopanel-web-master.tar.gz")
sha256sums=('9a1cdaf4987885fc8b4550f11705ecb212277ee53e9087c3cbaf15f17ff556d1'
            '5363812d2579146f0704c4c8626aeeed11741d9e9d87df3b071d4eae2eb5c412')

build() {
  cd ${srcdir}/gopanel-web-master
  npm install
  npm run build

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd ${srcdir}/${pkgname}-${pkgver}
  go build -v
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  mkdir -p "$pkgdir/etc/gopanel/app.conf.d"
  mkdir -p "$pkgdir/usr/share/gopanel"
  install -D -m 0755 gopanel "$pkgdir/usr/bin/gopanel"
  install -D -m 0644 systemd/gopanel.service "$pkgdir/usr/lib/systemd/system/gopanel.service"
  install -D -m 0644 config.default.json "$pkgdir/etc/gopanel/config.json"
  sed -i 's|http://localhost:2019|unix//run/caddy/admin.socket|g' "$pkgdir/etc/gopanel/config.json"
  cp -rf ${srcdir}/gopanel-web-master/build "${pkgdir}/usr/share/gopanel/web"
  chmod -R 0644 "${pkgdir}/usr/share/gopanel/web"
}

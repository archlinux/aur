# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel
pkgver=0.2.0
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
sha256sums=('b34d6e887176d9d2bd2f519ee2e40b12fb96b8ecc65da818f88663e4c3b7a599'
            '3a70c96c96d8e5e31cc994bf00fd50585934ee2513b930cadcd9f71796a5f118')

build() {
  cd ${srcdir}/gopanel-web-${pkgver}
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
  cp -rf ${srcdir}/gopanel-web-${pkgver}/build "${pkgdir}/usr/share/gopanel/web"
  chmod -R 0644 "${pkgdir}/usr/share/gopanel/web"
}

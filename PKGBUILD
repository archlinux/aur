# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=algernon
pkgver=1.12.7
pkgrel=1
pkgdesc='Web server with Lua, Markdown, QUIC, Redis and PostgreSQL support'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://algernon.roboticoverlords.org/'
license=(MIT)
makedepends=(git go)
optdepends=('mariadb: For using the MariaDB/MySQL database backend'
            'postgresql: For using the PostgreSQL database backend'
            'redis: For using the Redis database backend')
source=("algernon-${pkgver}.tar.gz::https://github.com/xyproto/algernon/archive/${pkgver}.tar.gz")
sha512sums=('b696c06815d89d19d0c46159914350c8dd130ef51e60e2c86060c3d15e73e44cbdc68ad4aef4ad508d05e0a0a096ffda7bd83464a08ec7e07fd54f509f880d68')

prepare() {
  cd "${pkgname}-${pkgver}"
  go build -mod=vendor -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm755 desktop/mdview "$pkgdir/usr/bin/mdview"
  install -Dm644 system/logrotate "$pkgdir/etc/logrotate.d/algernon"
  install -Dm644 system/serverconf.lua "$pkgdir/etc/algernon/serverconf.lua"
  install -Dm644 desktop/algernon.desktop \
    "$pkgdir/usr/share/applications/algernon.desktop"
  install -Dm644 desktop/algernon_md.desktop \
    "$pkgdir/usr/share/applications/algernon_md.desktop"
  install -Dm644 desktop/markdown.png "$pkgdir/usr/share/pixmaps/markdown.png"
  install -Dm644 system/algernon_dev.service \
    "$pkgdir/usr/share/doc/$pkgname/algernon.service.example"
  cp -r samples "$pkgdir/usr/share/doc/$pkgname/samples"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

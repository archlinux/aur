# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=algernon
pkgver=1.12.6
pkgrel=1
pkgdesc='Web server with Lua, Markdown, QUIC, Redis and PostgreSQL support'
arch=('any')
url='https://algernon.roboticoverlords.org/'
license=(MIT)
makedepends=(git go)
optdepends=('mariadb: For using the MariaDB/MySQL database backend'
            'postgresql: For using the PostgreSQL database backend'
            'redis: For using the Redis database backend')
source=("algernon-${pkgver}.tar.gz::https://github.com/xyproto/algernon/archive/${pkgver}.tar.gz")
sha512sums=('4158d31a907093af608f1fd9a598be4eeb4a9f8d68c6e51eaea6368e142edae95eb6170307451fec8b3c199d154c8d6ce35c6f46461c15e42b8f93a10e7dafe1')

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

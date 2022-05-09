# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=algernon
pkgver=1.13.0
pkgrel=1
pkgdesc='Web server with Lua, Markdown, QUIC, Redis and PostgreSQL support'
arch=(x86_64)
url='https://algernon.roboticoverlords.org/'
license=(BSD)
makedepends=(go)
optdepends=('mariadb: For using the MariaDB/MySQL database backend'
            'postgresql: For using the PostgreSQL database backend'
            'redis: For using the Redis database backend')
source=("git+https://github.com/xyproto/algernon#commit=9181256438b9a738127b9ac202ae03c2d8b50939")
b2sums=(SKIP)

prepare() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags $LDFLAGS"
}

package() {
  cd $pkgname
  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -d "$pkgdir/usr/share/doc/$pkgname/samples"
  cp -r samples "$pkgdir/usr/share/doc/$pkgname/samples"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd system
  install -Dm644 logrotate "$pkgdir/etc/logrotate.d/algernon"
  install -Dm644 serverconf.lua "$pkgdir/etc/algernon/serverconf.lua"
  install -Dm644 algernon_dev.service "$pkgdir/usr/share/doc/$pkgname/algernon.service.example"

  cd ../desktop
  install -Dm755 mdview "$pkgdir/usr/bin/mdview"
  install -Dm644 algernon.desktop "$pkgdir/usr/share/applications/algernon.desktop"
  install -Dm644 algernon_md.desktop "$pkgdir/usr/share/applications/algernon_md.desktop"
  install -Dm644 markdown.png "$pkgdir/usr/share/pixmaps/markdown.png"
}

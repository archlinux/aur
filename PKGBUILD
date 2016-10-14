# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=algernon
pkgver=1.2.1
pkgrel=1
pkgdesc='HTTP/2 web server with built-in support for Markdown, Lua, Sass (SCSS), JSX and Redis'
arch=('x86_64' 'i686')
url='http://algernon.roboticoverlords.org/'
license=('MIT')
makedepends=('go' 'git' 'glide')
optdepends=('redis: For using the Redis database backend'
            'mariadb: For using the MariaDB/MySQL database backend'
            'postgresql: For using the PostgreSQL database backend')
backup=('etc/algernon/serverconf.lua'
        'usr/lib/systemd/system/algernon.service')
source=("git://github.com/xyproto/algernon#tag=$pkgver")
md5sums=('SKIP')
install='algernon.install'
_gourl=github.com/xyproto/algernon

prepare() {
  export GOROOT=/usr/lib/go

  msg2 "Prepare build enviroment"
  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  export DESTPATH="$GOPATH/src/$_gourl"
  mkdir -p "$DESTPATH"

  rm -rf $DESTPATH
  mv "$srcdir/$pkgname" "$(dirname $DESTPATH)"

  # Glide
  msg2 "Download dependencies with Glide"
  cd "$GOPATH/src/$_gourl"
  glide update
  glide install
}

build() {
  cd "$GOPATH/src/$_gourl"

  msg2 "Build application"
  go fix
  go build -x
}

package() {
  cd "$GOPATH/src/$_gourl"

  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm644 system/algernon.service "$pkgdir/usr/lib/systemd/system/algernon.service"
  install -Dm644 system/logrotate "$pkgdir/etc/logrotate.d/algernon"
  install -Dm644 system/serverconf.lua "$pkgdir/etc/algernon/server.lua"
  install -Dm644 desktop/algernon.desktop "$pkgdir/usr/share/desktop/algernon.desktop"
  install -Dm755 desktop/mdview "$pkgdir/usr/bin/mdview"
  install -Dm644 desktop/markdown.png "$pkgdir/usr/share/pixmaps/markdown.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

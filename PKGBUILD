# Maintainer: Christoph W <c w e g e n e r at gmail dot com>

pkgname='usql'
_gitname='usql'
pkgver='0.5.0'
pkgrel='1'
pkgdesc='usql is a universal command-line interface for SQL databases'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/knq/usql'
license=('MIT')
depends=('go')
makedepends=('go' 'git')
provides=('usql')
#backup=('etc/influxdb/influxdb.conf')
#install='influxdb.install'
source=("git+https://github.com/knq/usql#tag=v$pkgver")
md5sums=('SKIP')
build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"

  go get -u github.com/kardianos/govendor

  mkdir -p "$GOPATH/src/github.com/knq"
  mv -f "$srcdir/usql" "$GOPATH/src/github.com/knq/"

  cd "$GOPATH/src/github.com/knq/usql"

  echo "Building usql version=$pkgver"
  #go install -ldflags="-X main.version=$version -X main.commit=$revision -X main.branch=master" ./...
  TAGS="most fts5 vtable json1"
  TAGS="$TAGS no_adodb"

  govendor init
  govendor fetch ./...
  govendor remove github.com/knq/usql/internal

  go install -tags "$TAGS" \
  -ldflags="-X github.com/knq/usql/text.CommandName=$pkgname -X github.com/knq/usql/text.CommandVersion=$pkgver"


}
package()
{
  cd $GOBIN
  install -Dsm755 usql "$pkgdir/usr/bin/usql"

  cd "$GOPATH/src/github.com/knq/usql"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/usql/README.md"
  install -Dm644 "contrib/usqlpass" "${pkgdir}/usr/share/doc/usql/usqlpass"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/usql/LICENSE"
}

# Maintainer: Christoph W <c w e g e n e r at gmail dot com>

pkgname='usql'
_gitname='usql'
pkgver='0.6.0'
pkgrel='1'
pkgdesc='usql is a universal command-line interface for SQL databases'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/xo/usql'
license=('MIT')
depends=('go')
makedepends=('go' 'git')
provides=('usql')
source=("git+https://github.com/xo/usql#tag=v$pkgver")
md5sums=('SKIP')
build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"

  go get -u github.com/kardianos/govendor

  mkdir -p "$GOPATH/src/github.com/xo"
  mv -f "$srcdir/usql" "$GOPATH/src/github.com/xo/"

  cd "$GOPATH/src/github.com/xo/usql"

  echo "Building usql version=$pkgver"
  TAGS="most fts5 vtable json1"
  # Remove ADODB (unavailable on linux)
  # Temporarily remove Avatica (does not compile successfully)
  TAGS="$TAGS no_adodb no_avatica"

  govendor init
  govendor fetch ./...
  govendor remove github.com/xo/usql/internal

  go install -tags "$TAGS" \
  -ldflags="-X github.com/xo/usql/text.CommandName=$pkgname -X github.com/xo/usql/text.CommandVersion=$pkgver"


}
package()
{
  cd $GOBIN
  install -Dsm755 usql "$pkgdir/usr/bin/usql"

  cd "$GOPATH/src/github.com/xo/usql"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/usql/README.md"
  install -Dm644 "contrib/usqlpass" "${pkgdir}/usr/share/doc/usql/usqlpass"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/usql/LICENSE"
}

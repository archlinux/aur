# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='tickfmt'
_gitname='tickfmt'
pkgver='1.4.0'
pkgrel='1'
pkgdesc='Open source framework for processing, monitoring, and alerting on time series data'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
depends=('')
makedepends=('go' 'git')
provides=('tickfmt')
source=("git+https://github.com/influxdata/kapacitor#tag=v$pkgver"
)
md5sums=('SKIP'
)
build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  mv -f "$srcdir/kapacitor" "$GOPATH/src/github.com/influxdata/"

  cd "$GOPATH/src/github.com/influxdata/kapacitor/tick"

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building tickfmt version=$version commit=$revision branch=master"
  go install -ldflags="-X main.version=$version -X main.commit=$revision -X main.branch=master" ./cmd/...

}
package()
{
  cd $GOBIN
  install -Dsm755 tickfmt "$pkgdir/usr/bin/tickfmt"
  install -Dsm755 tickdoc "$pkgdir/usr/bin/tickdoc"
}

# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Maintainer: Adam S Levy <adam@aslevy.com>

pkgname='telegraf'
pkgver='1.6.3'
pkgrel='2'
pkgdesc='Server-level metric gathering agent for InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/InfluxData/telegraf'
license=('MIT')
makedepends=('go' 'git')
provides=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install="telegraf.install"
options=('emptydirs')
source=("git+https://github.com/influxdata/telegraf#tag=$pkgver"
        'telegraf.sysusers'
        'telegraf.tmpfiles')
sha256sums=('SKIP'
            '31c038721ff674519a506418b0d70045e2c51115a78a5939743886c44ef5e1bb'
            '36b309e79422ddbaf6067f814c8bd69bd842cc662c3c9dbbf507ee5716282779')

build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  cp -af "$srcdir/telegraf" "$GOPATH/src/github.com/influxdata/"

  cd "$GOPATH/src/github.com/influxdata/telegraf"

  echo "Downloading dependencies"
  go get github.com/sparrc/gdm
  gdm restore

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building ${pkgname} version=$version commit=$revision branch=master"
  _LDFLAGS="-X main.version=$version -X main.commit=$revision -X main.branch=master"
  go install -ldflags="$_LDFLAGS" ./...
}

package()
{
  cd "$srcdir"
  install -Dm644 telegraf.sysusers "$pkgdir/usr/lib/sysusers.d/telegraf.conf"
  install -Dm644 telegraf.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/telegraf.conf"

  cd "$GOBIN"
  install -Dsm755 telegraf "$pkgdir/usr/bin/telegraf"

  cd "$GOPATH/src/github.com/influxdata/telegraf"
  install -d "$pkgdir/etc/telegraf/telegraf.d/"
  install -Dm644 scripts/telegraf.service "$pkgdir/usr/lib/systemd/system/telegraf.service"
  install -Dm644 etc/telegraf.conf        "$pkgdir/etc/telegraf/telegraf.conf"
  install -Dm644 LICENSE                  "$pkgdir/usr/share/licenses/telegraf/LICENSE"
}

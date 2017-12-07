# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Maintainer: Adam S Levy <adam at aslevy.com>

pkgname='telegraf'
pkgver='1.4.5'
pkgrel='1'
pkgdesc='Server-level metric gathering agent for InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://influxdb.org/'
license=('MIT')
depends=('')
makedepends=('go' 'git')
provides=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install="telegraf.install"
options=('emptydirs')
source=("git+https://github.com/influxdata/telegraf#tag=$pkgver"
        'telegraf.sysusers'
        'telegraf.tmpfiles')
md5sums=('SKIP'
         '58cc9edf8fbf07e7d3a0357db78121b1'
         '9c7a4df3556cab94837c432f5e46cf04')

build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  mv -f "$srcdir/telegraf" "$GOPATH/src/github.com/influxdata/"

  cd "$GOPATH/src/github.com/influxdata/telegraf"

  echo "Downloading dependencies"
  go get github.com/sparrc/gdm
  gdm restore

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building influxdb version=$version commit=$revision branch=master"
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

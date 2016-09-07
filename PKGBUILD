# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='telegraf'
pkgver='0.13.2'
pkgrel='1'
pkgdesc='Server-level metric gathering agent for InfluxDB'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
depends=('go')
makedepends=('go' 'git')
provides=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install="telegraf.install"
source=("git+https://github.com/influxdata/telegraf#tag=$pkgver"
        'telegraf.install'
        'telegraf.sysusers'
				'telegraf.service')
md5sums=('SKIP'
         '9b2c2ba850bdb13e08bdfbfbc05a3a06'
         '58cc9edf8fbf07e7d3a0357db78121b1'
         'cd4d39cec1edf54ab2aa4b7599c81ecc')

build()
{
  export GOPATH="$srcdir"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  mv -f "$srcdir/telegraf" "$GOPATH/src/github.com/influxdata/"

  cd "$GOPATH/src/github.com/influxdata/telegraf"

  echo "Downloading dependencies"
  go get github.com/sparrc/gdm
  gdm restore

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building telegraf version=$version commit=$revision branch=master"
	go install -ldflags="-X main.Version=$version -X main.commit=$revision -X main.branch=master" ./...
}
package()
{
 	cd $srcdir
  install -Dm644 telegraf.sysusers "$pkgdir/usr/lib/sysusers.d/telegraf.conf"
  install -Dm644 telegraf.service "$pkgdir/usr/lib/systemd/system/telegraf.service"

  cd $GOPATH
  install -Dsm755 bin/telegraf "$pkgdir/usr/bin/telegraf"

  cd "$GOPATH/src/github.com/influxdata/telegraf"
  #install -Dm644 scripts/telegraf.service "$pkgdir/usr/lib/systemd/system/telegraf.service"
  install -Dm644 "etc/telegraf.conf" "$pkgdir/etc/telegraf/telegraf.conf"
  mkdir "$pkgdir/etc/telegraf/telegraf.d"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/telegraf/LICENSE"
}

# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://influxdb.org/'
license=('MIT')
depends=('go')
makedepends=('go' 'git')
provides=('influxdb')
backup=('etc/influxdb/influxdb.conf')
install='influxdb.install'
source=("git+https://github.com/influxdata/influxdb#tag=v$pkgver"
        "influxdb.install"
        "influxdb.sysusers")
md5sums=('SKIP'
         '3fe2817930f48f59596f6021aa4a67d7'
         '349ecdadb3035718a57e781913a01cf6')
build()
{
  export GOPATH="$srcdir"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  mv -f "$srcdir/influxdb" "$GOPATH/src/github.com/influxdata/"

  cd "$GOPATH/src/github.com/influxdata/influxdb"

  echo "Downloading dependencies"
  go get github.com/sparrc/gdm
  gdm restore

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building influxdb version=$version commit=$revision branch=master"
  go install -ldflags="-X main.version=$version -X main.commit=$revision -X main.branch=master" ./...

}
package()
{
  cd $srcdir
  install -Dm644 influxdb.sysusers "$pkgdir/usr/lib/sysusers.d/influxdb.conf"

  cd $GOPATH
  install -Dsm755 bin/influxd "$pkgdir/usr/bin/influxd"
  install -Dsm755 bin/influx "$pkgdir/usr/bin/influx"
  install -Dsm755 bin/influx_tsm "$pkgdir/usr/bin/influx_tsm"

  cd "$GOPATH/src/github.com/influxdata/influxdb"
  install -Dm644 scripts/influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"
  install -Dm644 "etc/config.sample.toml" "$pkgdir/etc/influxdb/influxdb.conf"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/influxdb/LICENSE"
}

# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='1.1.0'
pkgrel='2'
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
        "influxdb.sysusers"
        "influxdb.tmpfiles")
md5sums=('SKIP'
         '0efb615d8319009fb767c4905ba80388'
         '349ecdadb3035718a57e781913a01cf6'
         '175d54bf6a82222ffe491f4a684582bd')
build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
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
  install -Dm644 influxdb.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/influxdb.conf"

  cd $GOBIN
  install -Dsm755 influxd "$pkgdir/usr/bin/influxd"
  install -Dsm755 influx "$pkgdir/usr/bin/influx"
  install -Dsm755 influx_tsm "$pkgdir/usr/bin/influx_tsm"
  install -Dsm755 influx_inspect "$pkgdir/usr/bin/influx_inspect"

  cd "$GOPATH/src/github.com/influxdata/influxdb"
  install -Dm644 scripts/influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"
  install -Dm644 "etc/config.sample.toml" "$pkgdir/etc/influxdb/influxdb.conf"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/influxdb/LICENSE"
}

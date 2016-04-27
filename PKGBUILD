# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='0.12.2'
pkgrel='1'
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=()
makedepends=('autoconf' 'protobuf' 'bison' 'flex' 'go' 'godep' 'gawk' 'mercurial' 'git' 'collectd')
checkdepends=()
optdepends=()
provides=('influxdb')
conflicts=()
replaces=()
backup=('etc/influxdb/influxdb.conf')
options=()
install="$pkgname.install"
source=("$pkgname.install")
changelog=
noextract=("$pkgtar")
md5sums=('SKIP')

prepare()
{
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"
  export INFLUXDBPATH="$GOPATH/src/github.com/influxdata/influxdb"
  if [ -d $GOBIN ]; then
    rm -rf $GOBIN;
  fi;

  go get github.com/influxdata/influxdb
  cd $INFLUXDBPATH
  git checkout "v$pkgver"
  go get github.com/sparrc/gdm
  $GOBIN/gdm restore
}
build()
{
  cd $INFLUXDBPATH
  commit=`git rev-parse HEAD`
  echo "Building $pkgname version=${pkgver} commit=$commit"
  go install -ldflags="-X main.version=${pkgver} -X main.commit=$commit" ./...
}
package()
{
  # systemctl service file
  install -D -m644  "$INFLUXDBPATH/scripts/influxdb.service" "$pkgdir/usr/lib/systemd/system/influxdb.service"

  # binaries
  install -D -m755 "$GOBIN/influxd" "$pkgdir/usr/bin/influxd"
  install -D -m755 "$GOBIN/influx" "$pkgdir/usr/bin/influx"

  # migration tool from 0.9 to 0.10
  install -D -m755 "$GOBIN/influx_tsm" "$pkgdir/usr/bin/influx_tsm"

  # configuration file
  install -D -m644 "$INFLUXDBPATH/etc/config.sample.toml" "${pkgdir}/etc/influxdb/influxdb.conf"

  # license
  install -Dm644 "$INFLUXDBPATH/LICENSE" "${pkgdir}/usr/share/licenses/influxdb/LICENSE"
}

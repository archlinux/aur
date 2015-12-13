# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='0.9.6.1'
branch='0.9.6'
commit='6d3a8603cfdaf1a141779ed88b093dcc5c528e5e'
pkgrel='1'
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64' 'armv6h')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=()
makedepends=('autoconf' 'protobuf' 'bison' 'flex' 'go' 'gawk' 'mercurial' 'git' 'collectd')
checkdepends=()
optdepends=()
provides=('influxdb')
conflicts=()
replaces=()
backup=('etc/influxdb.conf')
options=()
install="$pkgname.install"
pkgtar="v${pkgver}.tar.gz"
source=("https://github.com/influxdb/influxdb/archive/$pkgtar"
        "$pkgname.service"
        "$pkgname.install")
changelog=
noextract=("$pkgtar")
md5sums=('763f31f73913c7b0e1113723ead125cb'
         'SKIP'
         'SKIP')

prepare()
{ 
  export GOPATH="${srcdir}"
  export INFLUXDBGOPATH="$GOPATH/src/github.com/influxdb/influxdb"
  export GOBIN="$GOPATH/bin"
  if [ -d $GOBIN ]; then
    rm -rf $GOBIN;
  fi;

  echo "Extracting influxdb archive..."
  mkdir -p $INFLUXDBGOPATH
  tar -C $INFLUXDBGOPATH --strip-components=1 -xzf $pkgtar 

}
build() 
{
  echo "Building influxdb version=${pkgver} branch=$branch commit=${commit}..."
  cd $INFLUXDBGOPATH
  go get -ldflags="-X main.version=${pkgver} -X main.branch=$branch -X main.commit=$commit" ./...
  go install -ldflags="-X main.version=${pkgver} -X main.branch=$branch -X main.commit=$commit" ./...
}
package()
{
  # systemctl service file
  install -D -m644  "$srcdir/influxdb.service" "$pkgdir/usr/lib/systemd/system/influxdb.service"

  # binaries
  install -D -m755 "$GOBIN/influxd" "$pkgdir/usr/bin/influxd"
  install -D -m755 "$GOBIN/influx" "$pkgdir/usr/bin/influx"

  # configuration file
  install -D -m644 "$INFLUXDBGOPATH/etc/config.sample.toml" "${pkgdir}/etc/influxdb.conf"
  sed -i 's;/var/opt/;/var/lib/;g' "${pkgdir}/etc/influxdb.conf"

  # license
  install -Dm644 "$INFLUXDBGOPATH/LICENSE" "${pkgdir}/usr/share/licenses/influxdb/LICENSE"
}

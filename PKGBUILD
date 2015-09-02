# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='0.9.3'
commit='5d42b212fca8facfe9db0c83822f09b88be643ec'
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
source=("$pkgname.service"
        "$pkgname.install")
changelog=
noextract=()
md5sums=('SKIP'
         'SKIP')

prepare()
{ 
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"
  if [ -d $GOBIN ]; then
    rm "$GOBIN/*";
  fi;

  echo "Downloading influxdb ..."
  go get github.com/influxdb/influxdb

  echo "Downloading dependencies ..."
  cd "$GOPATH/src/github.com/influxdb"
  go get ./...
}
build() 
{
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"

  echo "Building influxdb ${pkgver} (commit ${commit}) ..."
  cd "$GOPATH/src/github.com/influxdb"
  go install -ldflags="-X main.version=$pkgver -X main.commit=$commit" ./...
}
package()
{
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"

  # systemctl service file
  install -D -m644  "$srcdir/influxdb.service" "$pkgdir/usr/lib/systemd/system/influxdb.service"

  # binaries
  install -D -m755 "$GOBIN/influxd" "$pkgdir/usr/bin/influxd"
  install -D -m755 "$GOBIN/influx" "$pkgdir/usr/bin/influx"

  # configuration file
  install -D -m644 "$GOPATH/src/github.com/influxdb/influxdb/etc/config.sample.toml" "${pkgdir}/etc/influxdb.conf"
  sed -i 's;/var/opt/;/var/lib/;g' "${pkgdir}/etc/influxdb.conf"

  # license
  install -Dm644 "$GOPATH/src/github.com/influxdb/influxdb/LICENSE" "${pkgdir}/usr/share/licenses/influxdb/LICENSE"
}

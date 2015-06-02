# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

_pkgname='influxdb'
pkgname="$_pkgname-git"
pkgver=v0.9.0.rc31.r74.g1fb9c54
pkgrel=1
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=('leveldb' 'rocksdb')
makedepends=('autoconf' 'protobuf' 'bison' 'flex' 'go' 'gawk' 'mercurial' 'git')
checkdepends=()
optdepends=()
provides=('influxdb')
conflicts=()
replaces=()
backup=('etc/influxdb.conf')
options=()
install="$_pkgname.install"
changelog=
source=("git+https://github.com/influxdb/influxdb.git"
        "$_pkgname.service"
	"$_pkgname.install")
noextract=()
md5sums=('SKIP'
         'a73293aa5489a70bdfa01f8a5dfee359'
         '56d2385232a6be54df21ec890d66f00c')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export GOPATH="$srcdir"
	mkdir -p "$srcdir/src/github.com/influxdb"
	mv "$srcdir/influxdb" "$srcdir/src/github.com/influxdb/"
	cd "$srcdir/src/github.com/influxdb/influxdb"
	go get -u -f ./...
	go build ./...
	go install ./...
}

check() {
  cd "$srcdir/src/github.com/influxdb/influxdb"
  # Required for testing
  go get github.com/davecgh/go-spew/spew
  go test -v ./...
}

package() {
  # systemctl service file
  install -D -m644  "$srcdir/influxdb.service" "$pkgdir/usr/lib/systemd/system/influxdb.service"

  cd "$srcdir/src/github.com/influxdb/influxdb"

  # influxdb binary
  install -D -m755 "$srcdir/bin/influx" "$pkgdir/usr/bin/influx"
  install -D -m755 "$srcdir/bin/influxd" "$pkgdir/usr/bin/influxd"
  install -D -m755 "$srcdir/bin/urlgen" "$pkgdir/usr/bin/urlgen"

  # configuration file
  cd etc
  sed -i 's|/var/opt/influxdb/raft|/var/lib/influxdb/raft|g' config.sample.toml
  sed -i 's|/var/opt/influxdb/db|/var/lib/influxdb/db|g' config.sample.toml
  install -D -m644 config.sample.toml "$pkgdir/etc/influxdb.conf"
}

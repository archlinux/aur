# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

_pkgname='influxdb'
pkgname="$_pkgname-git"
pkgver=v0.9.0.rc33.r80.ged4d009
pkgrel=1
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
makedepends=('autoconf' 'protobuf' 'bison' 'flex' 'go' 'gawk' 'mercurial' 'git')
checkdepends=()

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
         '37772f833acd9f5f8ac9c2bd3f1c3be8')

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

	sed -i 's|/var/opt|/var/lib|g' etc/config.sample.toml
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

  # influxdb binary
  install -D -m755 "$srcdir/bin/influx" "$pkgdir/usr/bin/influx"
  install -D -m755 "$srcdir/bin/influxd" "$pkgdir/usr/bin/influxd"
  install -D -m755 "$srcdir/bin/urlgen" "$pkgdir/usr/bin/urlgen"

  # configuration file
  install -D -m644 "$srcdir/src/github.com/influxdb/influxdb/etc/config.sample.toml" "$pkgdir/etc/influxdb.conf"
}

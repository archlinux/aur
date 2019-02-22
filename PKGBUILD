# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=influxdb-cli
pkgver=1.7.3
pkgrel=1
pkgdesc='InfluxDB command line interface'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/InfluxData/influxdb'
license=('MIT')
makedepends=('go-pie' 'git' 'asciidoc' 'xmlto' 'dep')
conflicts=('influxdb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb/archive/v${pkgver}.tar.gz")
sha256sums=('c3dc00f209cca8b9b742ddeffdd6ad0017afa992e6a7fc9279503f2a87e8ee65')

prepare(){
  export GOPATH="$srcdir/gopath"

  mkdir -p "$GOPATH/src/github.com/influxdata/"
  cp -r "${srcdir}/influxdb-$pkgver" "$GOPATH/src/github.com/influxdata/influxdb"
  cd "$GOPATH/src/github.com/influxdata/influxdb"
  dep ensure
}

build(){
  export GOPATH="$srcdir/gopath"

  _LDFLAGS="-X main.version=$pkgver -X main.branch=master -extldflags ${LDFLAGS}"
  go install -v -ldflags="$_LDFLAGS" -gcflags "all=-trimpath=${GOPATH}" -asmflags "all=-trimpath=${GOPATH}" "github.com/influxdata/influxdb/cmd/..."

  cd "$GOPATH/src/github.com/influxdata/influxdb/man/"
  make
}

check(){
  export GOPATH="$srcdir/gopath"
  go test "github.com/influxdata/influxdb/..."
}

package(){
  export GOPATH="$srcdir/gopath"

  cd "$GOPATH/bin"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 influx         "$pkgdir/usr/bin/"

  cd "$GOPATH/src/github.com/influxdata/influxdb"
  install -Dm644 LICENSE                  "$pkgdir/usr/share/licenses/influxdb-cli/LICENSE"

  # Install man pages
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 man/influx.1 "$pkgdir/usr/share/man/man1/"
}

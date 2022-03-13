# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=influxdb
pkgname=influxdb-cli
pkgver=2.1.1
pkgrel=1
pkgdesc='InfluxDB command line interface'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/InfluxData/influxdb'
license=('MIT')
makedepends=('go' 'git' 'asciidoc' 'xmlto' 'dep')
conflicts=('influxdb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb/archive/v${pkgver}.tar.gz"
        "fix-go114.patch::https://github.com/Foxboron/influxdb/commit/f8453b48862b50fe44021e320332f75e32457f29.patch"
        "fix-go115.patch::https://github.com/influxdata/influxdb/commit/3a03ad500a4b2bba65a4af74995ad54e88de7210.patch")
sha256sums=('0253741b3d2883435f6a49b72ec2647f56bcbbed9281f97c93f93ce3777d4e64'
            'f7194a068dfa1a68efe7b22f67a619697b605155cfde0ea61ef0e98a7473c89e'
            'f32363bf14e34aff8bb06d4345d8e2031a31a04c0e13bbc55a345f6e679eccb4')

prepare(){
  cd "${_pkgname}-${pkgver}"
  patch -Np1 < "$srcdir/fix-go114.patch"
  patch -Np1 < "$srcdir/fix-go115.patch"
  mkdir -p build
}

build(){
  cd "${_pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-linkmode external -X main.version=$pkgver -X main.branch=master"
  go build -v -ldflags="$_LDFLAGS" -o build ./cmd/...
  cd "man"
  make
}

check(){
  cd "${_pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go test ./...
}

package(){
  cd "${_pkgname}-${pkgver}"

  install -d "$pkgdir/usr/bin/"
  install -Dm755 build/influx  "$pkgdir/usr/bin/"

  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/influxdb-cli/LICENSE"

  # Install man pages
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 man/influx.1 "$pkgdir/usr/share/man/man1/"
}

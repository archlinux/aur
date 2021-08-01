# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=hysteria
pkgname=$_pkgbase
pkgver=0.8.2
pkgrel=1
pkgdesc='TCP relay & SOCKS5/HTTP proxy tool optimized for poor network environments'
arch=('x86_64')
url="https://github.com/HyNetwork/hysteria"
license=('MIT')
makedepends=('go' 'git')
source=("$_pkgbase"::"git+$url.git#tag=v$pkgver"
        hysteria@.service
        hysteria-server@.service
        sysusers.conf
        )
sha256sums=('SKIP'
            '2b0057f4f0e236ca59c91035e406c7c55df9b2420fd45c3dfe3efbc21c1fa046'
            'facb84351432dbac9a2bdfc9a4564fd87c0823a51d52b0bb6b7af5170feab676'
            'abaab463035e67c1e1728e5378b8f4a50960bf80d5005e02b3b2c9468f06150d')

prepare(){
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_pkgbase"
  mkdir -p build/
}

build() {
  cd "$srcdir/$_pkgbase"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOLDFLAGS="-w -s"
  export GOLDFLAGS="$GOLDFLAGS -X 'main.appVersion=$(git describe --tags)'"
  export GOLDFLAGS="$GOLDFLAGS -X 'main.appCommit=$(git rev-parse HEAD)'"
  export GOLDFLAGS="$GOLDFLAGS -X 'main.appDate=$(date "+%F %T")'"
  go build -o build/$_pkgbase -ldflags "$GOLDFLAGS" ./cmd/...
}

#check() {
#  cd "$srcdir/$_pkgbase"
#  go test ./...
#}

package() {
  # install hysteria
  install -Dm755 "$srcdir/$_pkgbase/build/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  # install sysusers
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"

  # install systemd service
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"

  # install config directory
  install -dm755 "$pkgdir/etc/hysteria"
}

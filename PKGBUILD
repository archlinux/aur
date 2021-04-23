# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=hysteria
pkgname=$_pkgbase
pkgver=0.6.0
pkgrel=1
pkgdesc='TCP relay & SOCKS5/HTTP proxy tool optimized for poor network environments'
arch=('x86_64')
url="https://github.com/tobyxdd/hysteria"
license=('MIT')
makedepends=('go')
source=("$_pkgbase-$pkgver.tar.gz"::"https://github.com/tobyxdd/hysteria/archive/refs/tags/v$pkgver.tar.gz"
        hysteria@.service
        hysteria-server@.service
        sysusers.conf
        )
sha256sums=('e657edd1bfe5255e435d1a1e247ce1530f6a87442d1aada252a13f4abc519852'
            '14f94bc69c150c20cba7f0775ae5b718130965887acdd885f77e18e6447a3f2c'
            'facb84351432dbac9a2bdfc9a4564fd87c0823a51d52b0bb6b7af5170feab676'
            'abaab463035e67c1e1728e5378b8f4a50960bf80d5005e02b3b2c9468f06150d')

prepare(){
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_pkgbase-$pkgver"
  mkdir -p build/
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$_pkgbase ./cmd/...
}

#check() {
#  cd "$srcdir/$_pkgbase-$pkgver"
#  go test ./...
#}

package() {
  # install hysteria
  install -Dm755 "$srcdir/$_pkgbase-$pkgver/build/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  # install sysusers
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"

  # install systemd service
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"

  # install config directory
  install -dm755 "$pkgdir/etc/hysteria"
}

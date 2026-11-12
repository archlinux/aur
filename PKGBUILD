# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=orchestrator
pkgver=3.2.6.25
pkgrel=1
pkgdesc='MySQL replication topology management and HA'
arch=(x86_64)
url='https://github.com/percona/orchestrator'
license=('Apache-2.0')
conflicts=("${pkgname}-bin")
depends=(glibc bash)
makedepends=('go')
options=(!lto)
source=("$pkgname-${pkgver%.*}-${pkgver##*.}.tar.gz::$url/archive/refs/tags/v${pkgver%.*}-${pkgver##*.}.tar.gz")
sha256sums=('1e478b0b1cdffc93ac01d085cde723419d5f127c358c379c2a1244c2e1657881')

prepare() {
  cd "$pkgname-${pkgver%.*}-${pkgver##*.}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-${pkgver%.*}-${pkgver##*.}"
  mkdir -p bin

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
    -ldflags "-X 'main.AppVersion=$pkgver-$_pkgrelease'" \
    -o bin/$pkgname ./go/cmd/orchestrator/main.go

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-${pkgver%.*}-${pkgver##*.}"
  install -d "$pkgdir/usr/bin"
  install -Dm755 bin/$pkgname "$pkgdir/usr/share/$pkgname/$pkgname"
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -a conf/orchestrator-sample*.json "$pkgdir/usr/share/$pkgname/"
  cp -a resources "$pkgdir/usr/share/$pkgname/"
  install -Dm644 etc/systemd/orchestrator.service -t "$pkgdir/usr/lib/systemd/system/"
}

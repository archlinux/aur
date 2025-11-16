# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=orchestrator
pkgver=3.2.6
_pkgrelease=18
pkgrel=2
pkgdesc='MySQL replication topology management and HA'
arch=(x86_64)
url='https://github.com/percona/orchestrator'
license=('Apache-2.0')
conflicts=("${pkgname}-bin")
depends=(glibc)
makedepends=('go')
options=(!lto)
source=("$pkgname-$pkgver-$_pkgrelease.tar.gz::$url/archive/refs/tags/v$pkgver-$_pkgrelease.tar.gz")
sha256sums=('8332a2875b3ab4ae779c16cb299adde246aba6bbd326c0d758fb7cd3c550bd9e')

prepare() {
  cd "$pkgname-$pkgver-$_pkgrelease"
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "$pkgname-$pkgver-$_pkgrelease"
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
}

package() {
  cd "$pkgname-$pkgver-$_pkgrelease"
  install -d "$pkgdir/usr/bin"
  install -Dm755 bin/$pkgname "$pkgdir/usr/share/$pkgname/$pkgname"
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -a conf/orchestrator-sample*.json "$pkgdir/usr/share/$pkgname/"
  cp -a resources "$pkgdir/usr/share/$pkgname/"
  install -Dm644 etc/systemd/orchestrator.service -t "$pkgdir/usr/lib/systemd/system/"
}

# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=zfxtop
pkgdesc='fetch top for gen Z with X written by bubbletea enjoyer'
pkgver=0.2.1
pkgrel=1
license=('BSD2')
arch=('x86_64')
url='https://github.com/ssleert/zfxtop'
options=('!lto')
makedepends=("go>=1.18")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssleert/zfxtop/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('146eb2e4924da1a48ff7301b62717815541fa107676a52a0095d25320f4a62c4')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"

  # https://github.com/ssleert/zfxtop/blob/master/scripts/build.sh#L1
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

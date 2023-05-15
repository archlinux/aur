# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=zfxtop
pkgdesc='fetch top for gen Z with X written by bubbletea enjoyer'
pkgver=0.3.2
pkgrel=1
license=('BSD2')
arch=('x86_64')
url='https://github.com/ssleert/zfxtop'
options=('!lto')
makedepends=("go>=1.18")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssleert/zfxtop/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('801298918fc6a98dfb79e55060ec47c3daacfcd99a01347465e70650e7a2cc03')

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

# Maintainer: ml <>
pkgname=vacuum
pkgver=0.0.55
pkgrel=1
pkgdesc='fast, lightweight OpenAPI linter and quality checking tool'
arch=('aarch64' 'i686' 'x86_64')
url=https://quobix.com/vacuum/
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/daveshanley/vacuum/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1ed2042605d6a269357c24ab1897b4f6c291f6e92fc7a442ddd1080822437ee3')

build() {
  _commit=$(bsdcat "$pkgname"-"$pkgver".tar.gz | git get-tar-commit-id)
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  TZ=UTC printf -v _date '%(%F %T %Z)T' "$SOURCE_DATE_EPOCH"
  go build -ldflags "-linkmode=external \
    -X main.version=v$pkgver -X main.commit=$_commit -X 'main.date=$_date'"
}

#check() {
#  cd "$pkgname-$pkgver"
#  go test  -ldflags "-linkmode=external" ./...
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 vacuum -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}

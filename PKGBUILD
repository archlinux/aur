# Maintainer: ml <ml AHHHH visu.li>
pkgname=svu
pkgver=1.2.0
pkgrel=1
pkgdesc='Semantic Version Util'
arch=('x86_64')
url='https://github.com/caarlos0/svu'
license=('MIT')
# grep -rF exec.Command
depends=('git')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('88c38afb2df071380bce852776274951af6cbb5f6f094a6fe9ec905bcf33e2e0')

prepare() {
  cd "$pkgname-$pkgver"
  go get -d
}

build() {
  cd "$pkgname-$pkgver"
  # enforce CGO_ENABLED=1 so the build does not break for AUR users having CGO_ENABLED=0
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  export GOLDFLAGS="-linkmode=external -X main.version=v$pkgver"
  go build -o "$pkgname" -ldflags "$GOLDFLAGS"
  #grep -Fwq "x$pkgver" "$pkgname"
}

# no upstream tests
#check() {
#  cd "$pkgname-$pkgver"
#  go test -ldflags "$GOLDFLAGS" -short ./...
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

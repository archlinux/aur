# Maintainer: ml <ml AHHHH visu.li>
pkgname=svu
pkgver=1.3.1
pkgrel=1
pkgdesc='Semantic Version Util'
arch=('x86_64')
url='https://github.com/caarlos0/svu'
license=('MIT')
# grep -rF exec.Command
depends=('git')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('55c45a610c3e495dbbd7da3d8980fcb1b615dac580e42606161e8e338efaf670')

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

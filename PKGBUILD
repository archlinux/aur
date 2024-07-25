# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=tbls
pkgver=1.77.0
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database"
arch=(x86_64)
url="https://github.com/k1LoW/tbls"
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6be85cfa82cf3a75bca03cd49739307f5ca60768624742f7020d36a1c5ee4984')

prepare() {
  cd $pkgname-$pkgver

  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd $pkgname-$pkgver

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="$srcdir"

  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "$ld_flags"
}

check() {
  cd $pkgname-$pkgver

  go test
}

package() {
  cd $pkgname-$pkgver

  ./tbls completion bash \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tbls"
  ./tbls completion fish \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/tbls.fish"
  ./tbls completion zsh \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tbls"

  install -Dm755 -t "$pkgdir/usr/bin" tbls
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

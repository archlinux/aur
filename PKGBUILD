# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=tbls
pkgver=1.92.3
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database"
arch=(x86_64)
url="https://github.com/k1LoW/tbls"
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('b38843a1c3a5e7b4a691ca2b41fcfeb3decc627129e7295c51ee679beb6cb0d6c8dbad9bce60c340bd76565fc488fd8821a67141558fe0c0bd28eb28ca23739f')

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

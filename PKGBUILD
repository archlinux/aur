# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alkindi42

pkgname=sqlc
pkgver=1.10.0
pkgrel=1
pkgdesc="Compile SQL to type-safe Go"
arch=('x86_64')
url="https://sqlc.dev"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kyleconroy/sqlc/archive/v$pkgver.tar.gz")
sha512sums=('72957c6dc2e3a88033a91d10a0943d380d3d97fd4e4b4f0eb6563d3e7df2d2b6c291258f5c1a80564ad6122393985617e204a2985876cc25dabb922bb72c7f97')
b2sums=('f5fd227b3b1d0c9a12f1ae2249d05e52765ac512e9357da6afa98f074ccf1a41365978889ffe3a51c40e9bf076685d08bd3eba5e06670ebe676ceec4f74ac50c')

prepare() {
  cd "$pkgname-$pkgver"

  # create folder for build output
  mkdir -p build

  # download dependencies
  go mod download
}
build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # build binary
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    ./cmd/...

  # generate shell completions
  for sh in bash fish zsh; do
    ./build/sqlc completion "$sh" > "build/$sh"
  done
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/sqlc

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # shell completions
  install -vDm644 build/bash "$pkgdir/usr/share/bash-completion/completions/sqlc"
  install -vDm644 build/fish "$pkgdir/usr/share/fish/vendor_completions.d/sqlc.fish"
  install -vDm644 build/zsh "$pkgdir/usr/share/zsh/site-functions/_sqlc"
}

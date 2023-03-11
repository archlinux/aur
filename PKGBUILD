# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.13.12
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(x86_64)
url=https://github.com/stripe/stripe-cli
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/stripe/stripe-cli/archive/v$pkgver.tar.gz)
b2sums=('d27a1cef7a00ba8a27376d6d6243381f35b600bb6bb31a7c4d00d3ee91d1ba13ebdefd6083d868ad5491bedacc564a4e6d98609e83a0f213d41d9d65698b0b17')

prepare() {
  cd $pkgname-$pkgver
  go mod download
}

build() {
  cd $pkgname-$pkgver

  go generate ./...

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o stripe \
    cmd/stripe/main.go
}

# Tests are disabled until https://github.com/stripe/stripe-cli/issues/1020 is resolved
#check() {
#  cd $pkgname-$pkgver
#  go test -failfast -race -coverpkg=./... -covermode=atomic -coverprofile=coverage.txt ./... -run . -timeout=2m
#}

package() {
  cd $pkgname-$pkgver
  install -D stripe -t "$pkgdir"/usr/bin
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 stripe-completion.bash "$pkgdir"/usr/share/bash-completion/completions/stripe
  cp -a docs "$pkgdir"/usr/share/doc/$pkgname
}

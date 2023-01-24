# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.13.8
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(x86_64)
url=https://github.com/stripe/stripe-cli
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/stripe/stripe-cli/archive/v$pkgver.tar.gz)
b2sums=('2c9d310d1ec6f8c0a2dd4051c59a5115315fcfd6907b35c205ae2f4d620f2c12331d721120ff8effa74b9ddfe606149d0329f659fba84de2a8bb2a28546c100e')

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

# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.16.0
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(x86_64)
url=https://github.com/stripe/stripe-cli
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/stripe/stripe-cli/archive/v$pkgver.tar.gz)
b2sums=('5666309e2e0ad530e139a81856b138e515b0fbd3de380ca2957670b9b421b137dced35361bd59dde1c34fea4451c93c23c02ad86c98a47ccface18bda63d3247')

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
  cp -a docs "$pkgdir"/usr/share/doc/$pkgname
}

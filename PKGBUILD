# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.14.1
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(x86_64)
url=https://github.com/stripe/stripe-cli
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/stripe/stripe-cli/archive/v$pkgver.tar.gz)
b2sums=('203640e9efeedb6a0e73b1f29f5d6e17c97f04445fe40946905ddd3350c92029ff56fb71e0430e2f460515408e444a09a27ab5816723ae8f39bfceaa886b544a')

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

# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.14.7
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(x86_64)
url=https://github.com/stripe/stripe-cli
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/stripe/stripe-cli/archive/v$pkgver.tar.gz)
b2sums=('c4b878b67c118e85eef5816d7d4076ac993c3b81677da48535e673251f7472a6eb569960e5cd731d33f30f590502ba54aee31067200084645902007aaf62301d')

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

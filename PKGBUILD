# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.41.2
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(i686 x86_64 aarch64)
url=https://github.com/stripe/stripe-cli
license=(Apache-2.0)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('db33254c7dc025f2bf5ffaa1291ed7c6175b1bbe2b8113151aec3cc68c7f6d285a629c1b9053daa8ee590aa878a69ed0ac1bbb988782b3f4af84d240d8f5c0e3')

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
    -ldflags "-linkmode external -X github.com/stripe/stripe-cli/pkg/version.Version=$pkgver -extldflags \"${LDFLAGS}\"" \
    -o stripe \
    cmd/stripe/main.go
}

check() {
  cd $pkgname-$pkgver
  [[ "$(./stripe --version)" == "stripe version $pkgver" ]]

  # Tests are disabled until https://github.com/stripe/stripe-cli/issues/1020 is resolved
  #go test -failfast -race -coverpkg=./... -covermode=atomic -coverprofile=coverage.txt ./... -run . -timeout=2m
}

package() {
  cd $pkgname-$pkgver
  install -D stripe -t "$pkgdir"/usr/bin
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a docs "$pkgdir"/usr/share/doc/$pkgname
}

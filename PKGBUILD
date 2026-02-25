# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.37.0
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(i686 x86_64 aarch64)
url=https://github.com/stripe/stripe-cli
license=(Apache-2.0)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('d7f4ea111f48f214c97094a88c78117744c80eb1b57e8feb045e8d5b744e19171bd23838173dbd42ab15c9d032c11a67cb981c2fb0ab175e721a3ea78f99ed2e')

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

# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.38.3
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(i686 x86_64 aarch64)
url=https://github.com/stripe/stripe-cli
license=(Apache-2.0)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('69fdcad6c0802995ccce4e310182ad04676d029ddafbc8788a721b8cf8fd1ec7875a0088f5a0d30b459de85d436bc4e6a34dd53c33e3babdd6bad03e7015ba8c')

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

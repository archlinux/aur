# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-nextcloud-exporter
_pkgname=nextcloud-exporter
pkgver=0.4.0
pkgrel=1
pkgdesc="Prometheus exporter for Nextcloud metrics"
arch=('x86_64')
url="https://github.com/xperimental/nextcloud-exporter"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('dc81034bc0bc61b267abdf216f51db86b8f0e215c259bea8dfed3d65774e175f46d27f4b044ce2eed20faca1f39a2fe6945c2cf2029d1cc78131e23ebd0fbb7a')
b2sums=('f15b03c7de45c5c31438d9dd31e1556a9b381822b5a4de03beaebaa20f11d6ee62c9ee662624c07d54518f775188a084afbe6c16a20e9ef635fe3b7e6d7fa1b4')

prepare() {
  cd "$_pkgname-$pkgver"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$_pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=$pkgver \
    -X main.GitCommit=tarball" \
    -o build \
    .
}

check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

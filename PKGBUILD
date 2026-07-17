# Maintainer: Mateusz Kiersnowski <mateusz.kiersnowski@gmail.com>
pkgname=yubihsm-connector
pkgver=3.0.7
pkgrel=1
pkgdesc='Enables communication between a YubiHSM 2 and applications over HTTP'
arch=(x86_64)
url='https://developers.yubico.com/yubihsm-connector/'
license=(Apache-2.0)
depends=(glibc libusb)
makedepends=(go)
backup=(etc/yubihsm-connector.yaml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yubico/yubihsm-connector/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sysusers")
sha256sums=('2127b754afb3b191fb71e536c2c160a0e6975dad48b3d469c0e3f3290c0ee31c'
            '9e714c4f7e9b947b4c99466ce7a978df7000acafb4368df3279317be021c4353')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go generate
  go build -ldflags '-linkmode external' -o bin/yubihsm-connector
}

check() {
  cd "$pkgname-$pkgver"
  go vet
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/yubihsm-connector "$pkgdir/usr/bin/yubihsm-connector"
  install -Dm644 deb/yubihsm-connector.yaml "$pkgdir/etc/yubihsm-connector.yaml"
  install -Dm644 deb/yubihsm-connector.service \
    "$pkgdir/usr/lib/systemd/system/yubihsm-connector.service"
  install -Dm644 deb/70-yubihsm-connector.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-yubihsm-connector.rules"
  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/yubihsm-connector.conf"
}

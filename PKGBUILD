# Maintainer: Achilleas Koutsou <achilleas@koutsou.net>

pkgname=g13-ak
pkgdesc='Userspace Linux driver for the Logitech G13 gameboard'
pkgver=4
pkgrel=1
url="https://github.com/achilleas-k/g13-ak"
arch=(x86_64)
license=(Apache-2.0)
depends=('libusb')
makedepends=('go')
checkdepends=('go')
optdepends=()
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/achilleas-k/g13-ak/archive/refs/tags/v${pkgver}.tar.gz
  g13.service
)
sha256sums=('be9a2afc8c7ae833a5627935530ce3d69775f9666487d6005fbb48ca1d581972'
            'c7ab2fe541068452e4c605c7eb318930ece1ef664f0939360c576d5d60447c17')

prepare() {
  cd $pkgname-$pkgver
  mkdir -p build
}

build() {
  cd $pkgname-$pkgver

  go build -o build/g13 ./cmd/g13
}

package() {
  cd $pkgname-$pkgver

  # g13 is a bit too generic so let's avoid any potential conflicts by adding
  # a suffix to the binary
  install -Dm755 "build/g13" "${pkgdir}/usr/bin/g13-ak"

  mkdir -p "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 ../g13.service "${pkgdir}/usr/lib/systemd/user/"

  mkdir -p "${pkgdir}/usr/share/g13-ak/configs"
  install -Dm644 "configs/"* "${pkgdir}/usr/share/g13-ak/configs"

  mkdir -p "${pkgdir}/usr/share/g13-ak/images"
  install -Dm644 "images/"* "${pkgdir}/usr/share/g13-ak/images"
}

check() {
  cd $pkgname-$pkgver

  go test -race ./...
}

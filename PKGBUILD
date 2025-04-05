# Maintainer: Achilleas Koutsou <achilleas@koutsou.net>

pkgname=g13-ak
pkgdesc='Userspace Linux driver for the Logitech G13 gameboard'
pkgver=1
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
sha256sums=('38cd9c7c883f66e68ba5090d7b7534a23258ed4c2103a2b749a0bbebcd16bc0d'
            'ba770d252497113236a53f2aeb5d395f2d86ca353998b45d99107ce20de1e8a4')

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

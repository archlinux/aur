# Maintainer: Achilleas Koutsou <aur@achilleas.org>

pkgname=gg13
pkgdesc='Userspace Linux driver for the Logitech G13 gameboard'
pkgver=6
pkgrel=1
url="https://github.com/achilleas-k/gg13"
arch=(x86_64)
license=(Apache-2.0)
depends=('libusb')
makedepends=('go')
checkdepends=('go')
optdepends=()
replaces=('g13-ak')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/achilleas-k/gg13/archive/refs/tags/v${pkgver}.tar.gz
  gg13.service
)
sha256sums=('10e0e8b645c992e76afb33180f3f1ad311f2eed488f97efb550e3477a9185ab6'
            '789fbf7a07bba75e1e8f7152830b98f7211c6abbfc1d9fbf46522c5869a56ae9')

prepare() {
  cd $pkgname-$pkgver
  mkdir -p build
}

build() {
  cd $pkgname-$pkgver

  go build -o build/gg13 ./cmd/gg13
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "build/gg13" "${pkgdir}/usr/bin/gg13"

  mkdir -p "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 ../gg13.service "${pkgdir}/usr/lib/systemd/user/"

  mkdir -p "${pkgdir}/usr/share/gg13/configs"
  install -Dm644 "configs/"* "${pkgdir}/usr/share/gg13/configs"

  mkdir -p "${pkgdir}/usr/share/gg13/images"
  install -Dm644 "images/"* "${pkgdir}/usr/share/gg13/images"
}

check() {
  cd $pkgname-$pkgver

  go test -race ./...
}

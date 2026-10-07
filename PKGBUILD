# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=xencelabs-quick-keys-go
pkgver=0.1
pkgrel=1
pkgdesc="Userland driver for the Xencelabs Quick Keys remote that simulates a virtual keyboard via uinput"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/xencelabs-quick-keys-go"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/xencelabs-quick-keys-go/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('20eff87f8e69cb58f809b07aaf7702012ab1c01e6f8bb2aef81fbafc2e1cbda8')

build() {
  cd "$pkgname-$pkgver"
  # The bundled libusb/hidapi build needs cgo, but no system USB headers.
  export CGO_ENABLED=1
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o xencelabs-quick-keys-go .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 xencelabs-quick-keys-go "$pkgdir/usr/bin/xencelabs-quick-keys-go"

  # Udev rule granting access to the device and /dev/uinput.
  install -Dm644 50-xencelabs.rules "$pkgdir/usr/lib/udev/rules.d/50-xencelabs.rules"

  # The driver reads config.yaml from the working directory; ship the example.
  install -Dm644 config.yaml "$pkgdir/usr/share/$pkgname/config.yaml"
}

# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=ipp-usb
pkgname=$_pkgname-git
pkgver=0.9.26.r5.gdf9f47f
pkgrel=1
pkgdesc="HTTP reverse proxy, backed by IPP-over-USB connection to device. Allows using the IPP protocol to be used with USB printers as well."
arch=('x86_64')
url="https://github.com/OpenPrinting/ipp-usb"
license=('BSD-2-Clause')
depends=('libusb' 'avahi')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=(etc/ipp-usb/ipp-usb.conf)
source=("git+${url}.git"
        'systemd-service.patch')
sha256sums=('SKIP'
            '8cec95d5de1fcc95187c6521971a0239a5503bbc08162e5d67cfef2439e07a76')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  patch -p1 < "${srcdir}"/systemd-service.patch
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  make test
}

package() {
  cd $_pkgname
  # upstream's Makefile isn't really usable, so copy manually
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 ipp-usb.conf "$pkgdir"/etc/ipp-usb/ipp-usb.conf
  install -Dm644 systemd-udev/71-ipp-usb.rules "$pkgdir"/usr/lib/udev/rules.d/71-ipp-usb.rules
  install -Dm644 systemd-udev/ipp-usb.service "$pkgdir"/usr/lib/systemd/system/ipp-usb.service
  install -Dm644 ipp-usb.8 "$pkgdir"/usr/share/man/man8/ipp-usb.8
  install -Dm644 ipp-usb-quirks/* -t "$pkgdir"/usr/share/ipp-usb/quirks
  install -Dm644 "${srcdir}"/$_pkgname/LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgname
}

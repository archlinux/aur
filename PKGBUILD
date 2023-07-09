# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: git

pkgname=hid-shanwan-dkms-git
pkgver=r5.698e2a5
pkgrel=2
pkgdesc="Kernel module for the Shanwan USB WirelessGamepad gamepad. (2563:0575)"
url="https://github.com/hbiyik/hid-shanwan"
arch=(i686 x86_64)
license=(GPL)
depends=('dkms')
makedepends=(git)
provides=("HID-SHANWAN=$pkgver-$pkgrel")
conflicts=(HID-SHANWAN)
source=("git+https://github.com/ahm-forks/hid-shanwan.git" dkms.conf)
sha256sums=('SKIP'
            '3fdc3eb59989b92cd180896275053df85fc62d0a64c7187a885ec03772bc98d7')

build() {
  sed -e "s/#MODULE_VERSION#/${pkgver}/" -i "dkms.conf"
}

pkgver() {
  cd "${pkgname%-dkms*}"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
  cd "${pkgname%-dkms*}"
  install -Dt "$pkgdir/usr/src/${pkgname%-dkms*}-$pkgver" -m644 Makefile hid-shanwan.c "$srcdir/dkms.conf"
}

# vim:set ts=2 sw=2 et ft=sh

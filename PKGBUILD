# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Sean Enck <enckse@gmail.com>

pkgname=pcsclite-git
pkgver=2.0.3.r0.gc4e7f6f9
pkgrel=1
pkgdesc="Middleware to access a smart card using SCard API (PC/SC)"
arch=('i686' 'x86_64')
url="https://pcsclite.apdu.fr/"
license=('BSD-3-Clause')
depends=('glibc' 'libsystemd.so' 'libudev.so' 'systemd')
makedepends=('git' 'autoconf-archive' 'pkgconf' 'polkit')
optdepends=('ccid: USB Chip/Smart Card Interface Devices driver'
            'python: API call trace logging with the pcsc-spy')
provides=("pcsclite=$pkgver" 'libpcsclite.so' 'libpcscspy.so')
conflicts=('pcsclite')
source=("git+https://salsa.debian.org/rousseau/PCSC.git")
sha256sums=('SKIP')


pkgver() {
  cd "PCSC"

  _tag=$(git tag -l --sort -creatordate | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^pcsc-//'
}

build() {
  cd "PCSC"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --enable-ipcdir \
    --enable-usbdropdir="/usr/lib/pcsc/drivers" \
    --with-systemdsystemunitdir="/usr/lib/systemd/system"
  make
}

check() {
  cd "PCSC"

  make check
}

package() {
  cd "PCSC"

  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/lib/pcsc/drivers"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/pcsclite"
}

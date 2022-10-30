# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Sean Enck <enckse@gmail.com>

pkgname=pcsclite-git
pkgver=1.9.9.r0.g15c16c7
pkgrel=1
pkgdesc="Middleware to access a smart card using SCard API (PC/SC)"
arch=('i686' 'x86_64')
url="https://pcsclite.apdu.fr/"
license=('BSD')
depends=('glibc' 'libsystemd.so' 'libudev.so' 'python' 'systemd')
makedepends=('git' 'autoconf-archive' 'pkgconf')
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

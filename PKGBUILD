# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=aprsc-9m2pju-git
pkgver=r1886.a4efaa5
pkgrel=1
pkgdesc="Ham Radio APRS-IS software RX/TX iGate and server with multi-threading, written in C. Git version."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/hessu/aprsc"
license=('custom:BSD')
depends=('libevent' 'openssl' 'lksctp-tools' 'libcap')
makedepends=('git' 'gcc' 'make')
optdepends=('protobuf-c: optional support')
source=("git+https://github.com/hessu/aprsc.git"
        "aprsc.service")
md5sums=('SKIP' 'SKIP')
backup=('opt/aprsc/etc/aprsc.conf')
install=${pkgname}.install
provides=('aprsc')
conflicts=('aprsc')

pkgver() {
  cd "$srcdir/aprsc"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/aprsc/src"
  ./configure
  make
}

package() {
  cd "$srcdir/aprsc/src"
  make DESTDIR="$pkgdir" install

  # Install systemd unit
  install -Dm644 "$srcdir/aprsc.service" "$pkgdir/usr/lib/systemd/system/aprsc.service"
}

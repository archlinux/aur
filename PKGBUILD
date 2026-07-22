# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=aprsc-9m2pju-git
pkgver=r1918.74e0c01
pkgrel=1
pkgdesc="APRS-IS core server in C with chroot sandboxing, SCTP support, and web UI. Git version."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/9M2PJU/aprsc"
license=('BSD-3-Clause')
depends=('libevent' 'openssl' 'lksctp-tools' 'libcap' 'zlib')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/9M2PJU/aprsc.git")
md5sums=('SKIP')
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
  ./configure --sbindir=/opt/aprsc/sbin --sysconfdir=/opt/aprsc/etc \
    --localstatedir=/opt/aprsc --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/aprsc/src"
  make DESTDIR="$pkgdir" install

  # systemd units (from src/debian/)
  install -Dm644 debian/aprsc.service      "$pkgdir/usr/lib/systemd/system/aprsc.service"
  install -Dm644 debian/aprsc@.service     "$pkgdir/usr/lib/systemd/system/aprsc@.service"
  install -Dm644 debian/aprsc-chroot.service "$pkgdir/usr/lib/systemd/system/aprsc-chroot.service"

  # AppArmor profile
  install -Dm644 apparmor.aprsc "$pkgdir/etc/apparmor.d/opt.aprsc.sbin.aprsc"

  # Man page
  install -Dm644 aprsc.8 "$pkgdir/usr/share/man/man8/aprsc.8"
}

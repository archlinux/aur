# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=aprsc-9m2pju-git
pkgver=3.0.2.r0.gd16d35c
pkgrel=1
pkgdesc="APRS-IS core server in C with chroot sandboxing, SCTP support, and web UI. Git version."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/9M2PJU/9M2PJU-APRSC-Installer"
license=('BSD-3-Clause')
depends=('libevent' 'openssl' 'lksctp-tools' 'libcap' 'zlib' 'protobuf-c')
makedepends=('git' 'gcc' 'make')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
backup=('opt/aprsc/etc/aprsc.conf')
install=${pkgname}.install
provides=('aprsc')
conflicts=('aprsc' 'aprsc-9m2pju-bin')

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
  else
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/$pkgname/src"
  # IS2 is upstream's inter-server protocol. It is disabled here to match the
  # upstream images and packages: it needs a second aprsc to peer with and only
  # adds CPU. protobuf-c is still a hard build dependency, because configure
  # and the Makefile compile and link the IS2 objects unconditionally.
  ./configure --disable-is2 \
    --sbindir=/opt/aprsc/sbin --sysconfdir=/opt/aprsc/etc \
    --localstatedir=/opt/aprsc --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname/src"
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

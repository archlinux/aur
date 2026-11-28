# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=aprsc-9m2pju-git
pkgver=3.0.2.r0.gd16d35c
pkgrel=2
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

# Build IS2, upstream's inter-server protocol?
#   0 = off (default). Matches the 9M2PJU container images and the .deb/.rpm
#       release artifacts. IS2 is inert without another IS2 server to peer
#       with, and it grows every packet buffer by ~200 bytes.
#   1 = on. Only worth it when this host peers with other IS2 servers, or when
#       you need reception metadata (RSSI/SNR/modem/frequency) from igates.
# Note that protobuf-c is required either way: configure and the Makefile
# compile and link the IS2 objects even when the flag is off.
_with_is2=${_with_is2:-0}

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
  local _is2flag=--disable-is2
  [ "$_with_is2" = "1" ] && _is2flag=--enable-is2
  ./configure "$_is2flag" \
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

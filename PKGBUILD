# vim:set ts=2 sw=2 et:
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=addrwatch-git
_pkgname=addrwatch
pkgver=1.0.1.r4.g3ac9f4e
pkgrel=4
pkgdesc='A tool similar to arpwatch for IPv4/IPv6 and ethernet address pairing monitoring'
arch=('x86_64' 'i686')
url="https://github.com/fln/addrwatch"
license=('GPL')
depends=('libpcap' 'libevent')
source=("$pkgname::git+https://github.com/fln/$_pkgname.git"
        "$pkgname.service"
        "$pkgname.rules")

makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's,\([^-]-g.*\),r\1,;s,-,.,g;s,^[^0-9]*,,'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf <<-END
    d /var/lib/addrwatch 0755 - - -
END
  install -Dm644 ../$pkgname.service "$pkgdir"/usr/lib/systemd/system/${_pkgname}\@.service
  install -Dm644 ../$pkgname.rules "$pkgdir"/usr/lib/udev/rules.d/99-${_pkgname}.rules
}

sha512sums=('SKIP'
            '35aeb27ed449c29780a1a1ec0b9cf4efafdca2397e94d15e1590244e3799b14c29d043dcce9d68be341423fc56fac9c6ed62c0f95ce1efbb5603d0509bc9e935'
            'ec8fdcc3d88ed433e5fc28e6c0394ddae7af8d2085e37872bbd85127e1c008b2d3e541644cc28a3d05e9ff8718964205d43b1661d580300b1696789a98ba4c29')

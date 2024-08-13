# Maintainer: omgold@aur
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=kronosnet
pkgver=1.29
pkgrel=1
pkgdesc="VPNs on steroids"
arch=('i686' 'x86_64')
url="http://www.kronosnet.org/"
license=('GPL2')
makedepends=('lksctp-tools' 'doxygen' 'libqb' 'libgcrypt')
depends=('nss' 'lzo' 'zstd' 'bzip2' 'libnl')
source=("https://kronosnet.org/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('439c18b18c69cf3758a1fc433ac4a01b94750269f9b5249a2a9d0ada98570c8e')

prepare() {
  cd ${pkgname}-${pkgver}
  #echo ${pkgver}|sed 's,\.r,.,;s,\.g,-,;s,..$,,' >.tarball-version
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  # Fight unused direct deps
  #sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:


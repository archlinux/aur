# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname="smcroute-git"
_pkgname=smcroute
pkgver=2.5.5.r5.gf5bf08e
pkgrel=1
pkgdesc="command line tool to manipulate kernel multicast routing"
arch=('i686' 'x86_64')
url="https://github.com/troglobit/smcroute"
license=('GPL2')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}" 'mcsender')
conflicts=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
depends=('libcap' 'bash' 'libsystemd.so')
makedepends=('git')
source=("$pkgname::git+https://github.com/troglobit/smcroute.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^0\.95\./1.99.2./'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --runstatedir=/run \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install

  install -Dm644 /dev/null  "${pkgdir}/etc/smcroute.conf"
  sed -e '/^[mp]/s,^,#,' smcroute.conf >"${pkgdir}/etc/smcroute.conf"
  install -Dm644 /dev/null  "${pkgdir}/usr/lib/tmpfiles.d/smcroute.conf"
  echo "d /etc/smcroute.d - -" >"${pkgdir}/usr/lib/tmpfiles.d/smcroute.conf"
}

# vim:set ts=2 sw=2 et:

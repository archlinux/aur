# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname="smcroute-git"
pkgver=2.0.0.r3.gd6280e6
pkgrel=1
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/smcroute"
license=('GPL2')
depends=('glibc')
provides=('smcroute' 'mcsender')
conflicts=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
source=("$pkgname::git+https://github.com/troglobit/smcroute.git"
        'smcroute.conf.example'
        'smcroute.service')
noextract=()   
md5sums=('SKIP'
         '98bdb5bbd222686761e318ee04825b7a'
         '7b28500642045b2482f5ac873da0f86b')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^0\.95\./1.99.2./'
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install

  install -Dm644 "${srcdir}/smcroute.conf.example" "${pkgdir}/etc/smcroute.conf"
  install -Dm644 "${srcdir}/smcroute.service" "${pkgdir}/usr/lib/systemd/system/smcroute.service"
  # nothing useful here
  rm -fr "${pkgdir}/usr/share/doc"
}

# vim:set ts=2 sw=2 et:

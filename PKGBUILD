# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=powerdns-recursor-git
pkgver=r10670.c9e9905
pkgrel=1
pkgdesc='Resolving DNS server'
arch=('i686' 'x86_64')
url='http://www.powerdns.com/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns")
sha512sums=('SKIP')
makedepends=('boost' 'git' 'pandoc' 'ragel' )
depends=('boost-libs' 'libsystemd' 'lua' 'openssl' 'protobuf' )
provides=('powerdns-recursor')
conflicts=('powerdns-recursor')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/pdns/recursordist"
  ./bootstrap
  ./configure \
      --prefix=/usr \
      --sbindir=/usr/bin \
      --sysconfdir=/etc/powerdns \
      --disable-silent-rules \
      --enable-reproducible
  make
}

package() {
  cd "${srcdir}/${pkgname}/pdns/recursordist/"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/powerdns/recursor.conf-dist" "${pkgdir}/etc/powerdns/recursor.conf"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

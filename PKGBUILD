# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=dnsdist-git
pkgver=r9883.13506cd
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('i686' 'x86_64')
url='http://dnsdist.org/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns")
sha512sums=('SKIP')
makedepends=('boost' 'git' 'pandoc' 'ragel')
depends=('libsodium' 'libedit' 'lua52' )
provides=('dnsdist')
conflicts=('dnsdist')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/pdns/dnsdistdist"
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-libsodium \
    --enable-dnscrypt
  make
}

package() {
  cd "${srcdir}/${pkgname}/pdns/dnsdistdist/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

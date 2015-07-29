# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jens Adam <jra@byte.cx>

pkgname=zmap-git
pkgver=2.1.0.753.6144eb9
pkgrel=1
pkgdesc='Fast network scanner designed for Internet-wide network surveys'
url='https://zmap.io/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('gmp' 'hiredis' 'json-c' 'libpcap')
makedepends=('git' 'byacc' 'cmake' 'gengetopt')
provides=('zmap')
conflicts=('zmap')
backup=('etc/zmap/blacklist.conf' 'etc/zmap/zmap.conf')
source=(${pkgname}::git+https://github.com/zmap/zmap.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git tag -l|cut -d- -f1|sort -V -r|head -n1|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  cmake -DWITH_JSON=ON -DWITH_REDIS=ON
  make
}

package() {
  cd ${pkgname}
  install -Dm 755 src/zmap "${pkgdir}/usr/bin/zmap"
  install -Dm 644 src/zmap.1 "${pkgdir}/usr/share/man/man1/zmap.1"
  install -Dm 644 conf/* -t "${pkgdir}/etc/zmap"
  for F in AUTHORS CHANGELOG INSTALL README.md; do
    install -Dm 644 "${F}" "${pkgdir}/usr/share/doc/zmap/${F}"
  done
  cp -a examples "${pkgdir}/usr/share/doc/zmap"
}

# vim: ts=2 sw=2 et:

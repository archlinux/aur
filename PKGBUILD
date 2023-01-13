# Maintainer: Sven Hebrok <xoimex[at]gmail[dot]org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jens Adam <jra@byte.cx>
# Contributor: Arch3y <arch3y[at]archstrike[dot]org>

pkgname=zmap-git
pkgver=3.0.0.1215.118b910
pkgrel=1
pkgdesc='Fast network scanner designed for Internet-wide network surveys'
url='https://zmap.io/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('gmp' 'json-c' 'libpcap')
makedepends=('git' 'byacc' 'cmake' 'gengetopt' 'pkg-config')
provides=('zmap')
conflicts=('zmap')
backup=('etc/zmap/blocklist.conf' 'etc/zmap/zmap.conf')
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
  cmake -DWITH_JSON=ON -DWITH_REDIS=ON -DWITH_MONGO=ON
  make
}

package() {
  cd ${pkgname}
  install -Dm 755 src/{zmap,ztee,zblocklist} -t "${pkgdir}/usr/bin"
  install -Dm 644 src/*.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 conf/* -t "${pkgdir}/etc/zmap"
  install -Dm 644 AUTHORS CHANGELOG.md INSTALL.md README.md \
    -t "${pkgdir}/usr/share/doc/zmap"
  cp -a examples "${pkgdir}/usr/share/doc/zmap"
}

# vim: ts=2 sw=2 et:

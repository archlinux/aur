# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=medusa-git
pkgver=2.2_rc2.8.29a7899
pkgrel=1
pkgdesc="Speedy, massively parallel and modular login brute-forcer for network "
url="http://www.foofus.net/jmk/medusa/medusa.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('openssl')
optdepends=(
  'openssl: HTTP, MSSQL, SMBNT and SSL-based connection support'
  'libssh2: SSH support'
  'postgresql-libs: PostgreSQL support'
  'afpfs-ng: AFP support'
  'subversion: Subversion support'
  'freerdp: RDP support'
)
makedepends=('git' 'libssh2' 'libpqxx' 'afpfs-ng' 'subversion' 'freerdp')
source=(${pkgname}::git+https://github.com/jmk-foofus/medusa)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 misc/zsh/_medusa "${pkgdir}/usr/share/zsh/site-functions/_medusa"
  install -Dm 644 doc/*.html README NEWS -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

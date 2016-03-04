# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: fxbru <frxbru[at]gmail>

pkgname=sqlmap-git
pkgver=1.0.7119.242800c
pkgrel=1
pkgdesc='Automatic SQL injection and database takeover tool'
url='http://sqlmap.org'
arch=('any')
license=('GPL2')
depends=('python2' 'sh')
makedepends=('git')
provides=('sqlmap')
conflicts=('sqlmap')
backup=('etc/sqlmap.conf')
source=(${pkgname}::git://github.com/sqlmapproject/sqlmap.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//'|sed 's/\-/_/')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/doc"

  mv doc "${pkgdir}/usr/share/doc/${pkgname}"
  mv sqlmap.conf "${pkgdir}/etc/sqlmap.conf"
  ln -sf /etc/sqlmap.conf "${pkgdir}/opt/${pkgname}/sqlmap.conf"
  cp -R --no-preserve=ownership * "${pkgdir}/opt/${pkgname}"

  cat > "${pkgdir}/usr/bin/sqlmap" << EOF
#!/bin/sh
cd /opt/${pkgname}
python2 sqlmap.py "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/sqlmap"
}

# vim: ts=2 sw=2 et:

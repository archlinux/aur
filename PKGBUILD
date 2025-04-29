# Maintainer: a821
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: fxbru <frxbru[at]gmail>

pkgname=sqlmap-git
pkgver=1.9.4.r2.g663ab4a54
pkgrel=1
pkgdesc='Automatic SQL injection and database takeover tool'
url='https://sqlmap.org'
arch=('any')
license=('GPL-2.0-only')
depends=('python' 'sh')
makedepends=('git')
optdepends=(
  'perl: icmpsh extra tool'
  'python-sqlalchemy: MySQL/MariaDB connection'
)
provides=('sqlmap')
conflicts=('sqlmap')
backup=('etc/sqlmap.conf')
source=(${pkgname}::git+https://github.com/sqlmapproject/sqlmap.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python -m compileall .
  python -O -m compileall .
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
  cp -a --no-preserve=ownership * "${pkgdir}/opt/${pkgname}"

  cat > "${pkgdir}/usr/bin/sqlmap" << EOF
#!/bin/sh
cd /opt/${pkgname}
exec python sqlmap.py "\$@"
EOF
  cat > "${pkgdir}/usr/bin/sqlmapapi" << EOF
#!/bin/sh
cd /opt/${pkgname}
exec python sqlmapapi.py "\$@"
EOF

  chmod 755 "${pkgdir}/usr/bin/sqlmap"
  chmod 755 "${pkgdir}/usr/bin/sqlmapapi"
}

# vim: ts=2 sw=2 et:

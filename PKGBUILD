# Maintainer: Alan Placidina Maria <placidina[at]protonmail[dot]com>

pkgname=sqlmap-bin
pkgver=1.7.8
pkgrel=2
pkgdesc='Automatic SQL injection and database takeover tool'
url='http://sqlmap.org'
arch=('any')
license=('GPL2')
depends=('python' 'sh')
optdepends=('perl: icmpsh extra tool')
provides=('sqlmap')
conflicts=('sqlmap' 'sqlmap-git')
backup=('etc/sqlmap.conf')
source=(https://github.com/sqlmapproject/sqlmap/archive/${pkgver}/sqlmap-${pkgver}.tar.gz)
sha512sums=('9d22cd85682de2f111dd33aa7eed6c98e59f2067464f59074c571200e7bb2cc15477560a3c7c81e198f3fd006bde9a9289679c0cec08ffcf0e157d6d1fae4f51')
b2sums=('b28da71baa69f09ce8554c96ffedd06c4e41be785956fc895e2cd41d5cfed19af9c294bed8e6dc82e2e6c64704f6be578df3258af1ddad559f99b4b5e9f29c1e')

build() {
  cd sqlmap-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd sqlmap-${pkgver}

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
python sqlmap.py "\$@"
EOF
  cat > "${pkgdir}/usr/bin/sqlmapapi" << EOF
#!/bin/sh
cd /opt/${pkgname}
python sqlmapapi.py "\$@"
EOF

  chmod 755 "${pkgdir}/usr/bin/sqlmap"
  chmod 755 "${pkgdir}/usr/bin/sqlmapapi"
}

# vim: ts=2 sw=2 et:
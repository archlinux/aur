# Maintainer: Alan Placidina Maria <placidina[at]protonmail[dot]com>

pkgname=sqlmap
pkgver=1.6.8
pkgrel=1
pkgdesc='Automatic SQL injection and database takeover tool'
url='http://sqlmap.org'
arch=('any')
license=('GPL2')
depends=('python' 'sh')
optdepends=('perl: icmpsh extra tool')
provides=('sqlmap')
conflicts=('sqlmap' 'sqlmap-git')
backup=('etc/sqlmap.conf')
source=(${pkgname}::https://github.com/sqlmapproject/sqlmap/archive/${pkgver}/sqlmap-${pkgver}.tar.gz)
sha512sums=('e8849bb727ca84540fa9e44e580470aa6d853f7fcd1bddc2a51a5e4366a7eceedde80b3bd334f16753d5390ee0ac15fbd81551e79ada817bb11b6964dd439c9b')
b2sums=('49fddc4b7c62c9baa5d6732bb9150bd2b3e48a671f9a3601ffc0821d5784fa02fbba37bc057ecd43888c2678ae477cca46b279e59b8a672310836218700df241')

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd ${pkgname}-${pkgver}

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
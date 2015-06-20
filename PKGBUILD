# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=bokken
pkgver=1.8
pkgrel=1
pkgdesc="GUI for radare2 and pyew"
url="http://inguma.eu/projects/bokken"
arch=('any')
license=('GPL2')
depends=('pygtk' 'pygtksourceview2' 'python2-pillow' 'graphviz' 'r2-bindings')
source=(${pkgname}-${pkgver}.tar.gz::https://inguma.eu/attachments/download/212/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4fc34c054b018bdf2012024827d909420f4384d3de32196b319299794a9e7ccf0d1ce22987bad5526af077fe2486b0b3d89ce62ef762c3c84dee58cb32fa09d0')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's/env python$/env python2/g' -i ui/xdot.py lib/web/__init__.py lib/web/utils.py
  sed -e 's|/usr/bin/python|/usr/bin/env python2|g' -i bokken.py
  cat > bokken.sh << EOF
#!/bin/bash
cd /usr/share/bokken/
exec ./bokken "\$@"
EOF
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/bokken"
  install -Dm 755 bokken bokken.py "${pkgdir}/usr/share/bokken"
  cp -r lib static ui "${pkgdir}/usr/share/bokken"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 755 bokken.sh "${pkgdir}/usr/bin/bokken"
}

# vim: ts=2 sw=2 et:

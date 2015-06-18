# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=bokken
pkgver=1.7
pkgrel=1
pkgdesc="GUI for radare2 and pyew"
url="http://inguma.eu/projects/bokken"
arch=('any')
license=('GPL2')
depends=('pygtk' 'pygtksourceview2' 'python2-pillow' 'graphviz' 'r2-bindings')
optdepends=('pyew: pyew backend support')
source=(${pkgname}-${pkgver}.tar.gz::https://inguma.eu/attachments/download/209/${pkgname}-${pkgver}.tar.gz)
sha512sums=('369b493c83870dad243e5faa7b5cc5afa0c2879d33025cfe8d2776af06ab581052b5939586a29ad0697b0008d03e45d098229da0f184ca288a368ab52da4b6d9')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's/env python$/env python2/g' -i ui/xdot.py plugins/pdfid_PL.py \
    lib/web/__init__.py lib/web/utils.py
  sed -e 's|/usr/bin/python|/usr/bin/env python2|g' -i bokken.py
  sed -e 's|import Image|from PIL import Image|g' -i ui/graph.py
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
  cp -r lib plugins static ui "${pkgdir}/usr/share/bokken"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 755 bokken.sh "${pkgdir}/usr/bin/bokken"
}

# vim: ts=2 sw=2 et:

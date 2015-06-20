# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=bokken-hg
pkgver=1.8.4.a6e0bf349180
pkgrel=1
pkgdesc="GUI for radare2 and pyew"
url="http://inguma.eu/projects/bokken"
arch=('any')
license=('GPL2')
depends=('pygtk' 'pygtksourceview2' 'python2-pillow' 'graphviz' 'r2-bindings')
makedepends=('mercurial')
provides=('bokken')
conflicts=("bokken")
source=(${pkgname}::hg+https://inguma.eu/repos/bokken)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  hg log -r . --template '{latesttag}.{latesttagdistance}.{node|short}\n'
}

prepare() {
  cd ${pkgname}
  sed -e 's/env python$/env python2/g' -i ui/xdot.py lib/web/__init__.py lib/web/utils.py
  sed -e 's|/usr/bin/python|/usr/bin/env python2|g' -i bokken.py
  cat > bokken.sh << EOF
#!/bin/bash
cd /usr/share/bokken/
exec ./bokken "\$@"
EOF
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/usr/share/bokken"
  install -Dm 755 bokken bokken.py "${pkgdir}/usr/share/bokken"
  cp -r lib static ui "${pkgdir}/usr/share/bokken"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 755 bokken.sh "${pkgdir}/usr/bin/bokken"
}

# vim: ts=2 sw=2 et:

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bokken-hg
pkgver=1.8.28.6d1a9a1872ed
pkgrel=1
pkgdesc='GUI for radare2 and pyew'
url='https://bitbucket.org/inguma/bokken'
arch=('any')
license=('GPL2')
depends=('pygtk' 'gtksourceview3' 'python2-pillow' 'graphviz' 'radare2-bindings')
makedepends=('mercurial')
provides=('bokken')
conflicts=("bokken")
source=(${pkgname}::hg+https://bitbucket.org/inguma/bokken
        fix-new-radare.patch)
sha512sums=('SKIP'
            '478de59f170cf5d28ab0dbe16cf9cb1d472d40de3abbe049d9577319b2123b514cd08320213a36fa2ee441add680aa56fdfc721a26ee786ed59f1d12cc1825b9')

pkgver() {
  cd ${pkgname}
  hg log -r . --template '{latesttag}.{latesttagdistance}.{node|short}\n'
}

prepare() {
  cd ${pkgname}
  patch -p0 < "${srcdir}/fix-new-radare.patch"
  sed -e 's|" + self.target|{}".format(self.target)|g' -i ui/main.py
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
  install -Dm 755 bokken.sh "${pkgdir}/usr/bin/bokken"
  install -Dm 755 bokken bokken.py -t "${pkgdir}/usr/share/bokken"
  cp -r lib static ui "${pkgdir}/usr/share/bokken"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

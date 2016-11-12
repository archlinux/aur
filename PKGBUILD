# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bokken
pkgver=1.8
pkgrel=3
pkgdesc='GUI for radare2 and pyew'
url='https://bitbucket.org/inguma/bokken'
arch=('any')
license=('GPL2')
depends=('pygtk' 'pygtksourceview2' 'python2-pillow' 'graphviz' 'radare2-bindings')
makedepends=('mercurial')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/inguma/bokken/get/${pkgver}.tar.gz
        fix-new-radare.patch)
sha512sums=('1bec1c908bbfc5bf3dad121d98fc135a2b0ab9753077df113c7a5ca4059d3c7b86715ba2bd017fd1fa55e504e41eee4f22f76d551be4852371975ae45d3141f2'
            '478de59f170cf5d28ab0dbe16cf9cb1d472d40de3abbe049d9577319b2123b514cd08320213a36fa2ee441add680aa56fdfc721a26ee786ed59f1d12cc1825b9')

prepare() {
  cd inguma-bokken-*
  patch -p0 < "${srcdir}/fix-new-radare.patch"
  sed -e 's/env python$/env python2/g' -i ui/xdot.py lib/web/__init__.py lib/web/utils.py
  sed -e 's|/usr/bin/python|/usr/bin/env python2|g' -i bokken.py
  cat > bokken.sh << EOF
#!/bin/bash
cd /usr/share/bokken/
exec ./bokken "\$@"
EOF
}

package() {
  cd inguma-bokken-*
  install -Dm 755 bokken.sh "${pkgdir}/usr/bin/bokken"
  install -Dm 755 bokken bokken.py -t "${pkgdir}/usr/share/bokken"
  cp -r lib static ui "${pkgdir}/usr/share/bokken"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

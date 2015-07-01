# Maintainer: Alain Kalker <a.c.kalker at gmail dot com>
pkgname=seascope-hg
_pkgname=seascope
pkgver=155.ac74dbcdb6be
pkgrel=1
pkgdesc="A multi-platform multi-language source code browsing tool"
arch=('any')
url="http://code.google.com/p/seascope/"
license=('BSD')
depends=('python2-qscintilla' 'ctags')
makedepends=('mercurial' 'gendesk')
optdepends=('idutils: backend for C, lex, yacc, limited support for C++, Java'
            'cscope: backend for all languages supported by ctags'
            'global: backend for C, C++, Yacc, Java, PHP'
            'graphviz: generate class graphs')
provides=('seascope')
conflicts=('seascope')
options=(!emptydirs)
source=('hg+https://code.google.com/p/seascope')
md5sums=('SKIP')

_name=('Seascope')
_exec=('Seascope')

pkgver() {
  cd "$srcdir/$_pkgname"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  cd "$srcdir/"
  ln -sf "$srcdir/$_pkgname/src/icons/seascope.svg" "$pkgname.svg"
  gendesk -n

  cd "$srcdir/$_pkgname"

  # Use python2
  find -type f -exec sed -i -e '/^#!/s/python$/python2/' {} \;
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  chmod +x "$pkgdir/usr/lib/python2.7/site-packages/Seascope/Seascope.py"
  install -m755 -d "$pkgdir/usr/bin"
  ln -s /usr/lib/python2.7/site-packages/Seascope/Seascope.py "$pkgdir/usr/bin/Seascope"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

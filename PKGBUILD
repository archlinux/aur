# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Sascha Pfau

_realname=CuteMarkEd
pkgname=cutemarked
pkgver=0.11.3
pkgrel=1
pkgdesc="Qt Markdown editor with live HTML preview, math expressions and code syntax highlighting"
url="https://github.com/cloose/CuteMarkEd"
arch=(x86_64)
license=(GPL)
depends=(discount hicolor-icon-theme hunspell qt5-webkit)
makedepends=(qt5-tools)
optdepends=('mathjax2: formula support')
source=(https://github.com/cloose/CuteMarkEd/archive/v$pkgver/$_realname-$pkgver.tar.gz
        cutemarked-0.11.3-fix-build-against-qt-5.11.0.patch
        cutemarked.appdata.xml)
sha256sums=('78a41808c2f0452375810abdff76eeaaee012f8d1368a2b8772ec6b4d2ceeec8'
            'b9f6505f12c72b7f46b68c48452e3bc85d905c1640e5db04b341d4c57860d25c'
            '3bfe02706a664a03da411138301d39a613f8e9770120b69a43e5e96f3ec85fa0')

prepare() {
  cd $_realname-$pkgver
  patch -Np1 -i ../cutemarked-0.11.3-fix-build-against-qt-5.11.0.patch
  sed -i 's|http[s]\?://cdn.mathjax.org/mathjax/latest/MathJax.js|file:///usr/share/mathjax2/MathJax.js|' \
    app-static/template/htmltemplate.cpp app/template_presentation.html
  sed -i '/syntax.html/a <file>syntax_hu_HU.html</file>' app/resources.qrc
  sed -i 's/syntax_hu/syntax_hu_HU/' app/translations/cutemarked_hu_HU.ts
}

build() {
  cd $_realname-$pkgver
  qmake
  make
}
package() {
  cd $_realname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}

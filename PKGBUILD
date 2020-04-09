# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.6.0
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('x86_64')
url="https://drobilla.net/software/ganv/"
license=('GPL3')
depends=('atkmm' 'cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'glibmm'
'graphviz' 'gtkmm' 'harfbuzz' 'pangomm')
makedepends=('atk' 'glib2' 'gtk2' 'pango' 'waf')
provides=('libganv-1.so')
source=("https://download.drobilla.net/ganv-$pkgver.tar.bz2"{,.sig})
sha512sums=('05900aa63e65646e75f805dfe6ae5901efb19ae31a3f0a6730a713bfaffc47bb93f683879ce2a75093ea09e84a9d3137966b68b4ad307707753dead1df439a09'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

prepare() {
  cd "$pkgname-$pkgver"
  # copy custom waf scripts in place
  mkdir -pv tools
  cp -av waflib/extras/autowaf.py tools/
  touch __init__.py
  # remove vendored waf
  rm -rv waflib
  # modify wscript to use current scripts
  sed -e 's/waflib.extras/tools/' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/" \
      -i wscript
}

build() {
  cd "${pkgname}-${pkgver}"
  waf configure --prefix=/usr
  waf build -v
}

package() {
  depends+=('libatk-1.0.so' 'libfreetype.so' 'libgdk-x11-2.0.so'
  'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-x11-2.0.so'
  'libpangocairo-1.0.so' 'libpangoft2-1.0.so' 'libpango-1.0.so')
  cd "${pkgname}-${pkgver}"
  waf install -v --destdir="${pkgdir}"
  install -vDm 644 {AUTHORS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

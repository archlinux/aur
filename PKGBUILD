# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.8.0
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('x86_64')
url="https://drobilla.net/software/ganv/"
license=('GPL3')
depends=('atkmm' 'cairo' 'gcc-libs' 'glibc' 'glibmm' 'graphviz' 'gtkmm'
'pangomm')
makedepends=('atk' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'gtk2' 'harfbuzz' 'pango'
'waf')
provides=('libganv-1.so')
source=("https://download.drobilla.net/ganv-$pkgver.tar.bz2"{,.asc})
sha512sums=('00969879592af11d211ad790b970a8a3765ec0591515af856230e3fc9371b1611f2a4edc73d1fc59371a4c4a49c7479f279dc6f298d843296e6707cd2d495af4'
            'SKIP')
b2sums=('4936b7f87fa7cf17ed86b8165558684f0f59387c9673144d57d8505e41f367735117e9f5b08508dcecb831b77b6bbc6559323417824a9f8defc43c81cc91d469'
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
  depends+=('libatk-1.0.so' 'libfontconfig.so' 'libfreetype.so'
  'libgdk_pixbuf-2.0.so' 'libgdk-x11-2.0.so' 'libgio-2.0.so' 'libglib-2.0.so'
  'libgobject-2.0.so' 'libgtk-x11-2.0.so' 'libharfbuzz.so'
  'libpangocairo-1.0.so' 'libpangoft2-1.0.so' 'libpango-1.0.so')
  cd "${pkgname}-${pkgver}"
  waf install -v --destdir="${pkgdir}"
  install -vDm 644 {AUTHORS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

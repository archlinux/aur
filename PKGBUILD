# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=deteriorate-lv2
pkgver=1.0.7
pkgrel=1
pkgdesc="A set of plugins to deteriorate the sound quality of a live input"
arch=('x86_64')
url="https://objectivewave.wordpress.com/deteriorate-lv2/"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('atk' 'cairo' 'cairomm' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glibc'
'glib2' 'gtkmm' 'harfbuzz' 'libfreetype.so' 'pango' 'pangomm')
makedepends=('lv2' 'lvtk' 'waf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('dec154c7f45cb69906245993e03d5551ff06a052d50fae753d52643a1cf9ed60479c76d586bd0e9b7606cd4e5b3b866e80a791b9c21dd6cdd7415f9687ff847e')

prepare() {
  cd "${pkgname}-${pkgver}"
  # let wscript(s) find the custom waf scripts
  mkdir -pv tools
  touch __init__.py
  cp -v waflib/extras/{autowaf,lv2}.py tools/
  mkdir -pv plugins/tools/
  cp -v waflib/extras/{autowaf,lv2}.py plugins/tools/
  rm -rv waflib
  sed -e 's/waflib.extras/tools/g' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/g" \
      -e "s/load('lv2'/load('lv2', tooldir='tools'/g" \
      -i wscript
}

build() {
  cd "$pkgname-$pkgver"
  waf configure --prefix=/usr
  waf
}

package() {
  cd "$pkgname-$pkgver"
  waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

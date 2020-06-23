# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=deteriorate-lv2
pkgver=1.0.7
pkgrel=2
pkgdesc="A set of plugins to deteriorate the sound quality of a live input"
arch=('x86_64')
url="https://github.com/blablack/deteriorate-lv2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('atk' 'cairo' 'cairomm' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glibc'
'gtkmm' 'libsigc++' 'pangomm')
makedepends=('freetype2' 'glib2' 'gtk2' 'harfbuzz' 'lv2' 'lvtk' 'pango' 'waf')
checkdepends=('lv2lint')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz")
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

check() {
  local _name
  cd "$pkgname-$pkgver"
  for _name in {downsampler_{mono,stereo},granulator_{mono,stereo}}; do
    lv2lint -Mpack \
            -I "build/${pkgname//-/.}" \
            "http://github.com/blablack/deteriorate-lv2/${_name}" \
            || echo "Known to fail: https://github.com/blablack/deteriorate-lv2/issues/10"
  done
}

package() {
  depends+=('libatk-1.0.so' 'libfreetype.so' 'libgdk-x11-2.0.so'
  'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-x11-2.0.so'
  'libharfbuzz.so' 'libpango-1.0.so' 'libpangocairo-1.0.so'
  'libpangoft2-1.0.so')
  cd "$pkgname-$pkgver"
  waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

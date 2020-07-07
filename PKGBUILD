# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=beatslash-lv2
pkgver=1.0.6
pkgrel=3
pkgdesc="A set of plugins for live beat repeating and beat slicing"
arch=('x86_64')
url="https://objectivewave.wordpress.com/beatslash-lv2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gtkmm')
makedepends=('lv2' 'lvtk' 'waf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d20262946479cbbec1e48dd72a89be46f88d2f48fe55ba5d35535dcdcd1226d52cf57f335dd3aeb3f794590848bbd48e98eb0bf692840f3bd5e600ae93ca8614')

prepare() {
  cd "$pkgname-$pkgver"
  # moving customizations out
  mkdir -pv tools
  mv -v waflib/extras/{autowaf,lv2}.py tools/
  touch __init__.py
  # removing custom waflib
  rm -rv waflib
  # making sure autowaf is found and lv2 is loaded from tools dir
  sed -e 's/waflib.extras/tools/g' \
      -e "s/('lv2')/('lv2', tooldir='tools')/" \
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

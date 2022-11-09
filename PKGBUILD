# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=midimsg-lv2
pkgver=0.0.5
pkgrel=1
pkgdesc="A collection of basic LV2 plugins to translate midi messages to usable values"
arch=('x86_64')
url="https://github.com/blablack/midimsg-lv2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gcc-libs' 'glibc')
makedepends=('lv2' 'waf')
checkdepends=('lv2lint' 'sord')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e2977dfda904e48e87fdfb416b700efae578ceeb81cbcf1ad1a40a3dc0a80e8b92a98d846d25deb367f1763a285816a99ec3db399137f5faa5b53c9bcc1646cb')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -vp tools
  touch __init__.py
  cp -v waflib/extras/{autowaf,lv2}.py tools
  # modify wscript to use current scripts and fix version
  sed -e 's/waflib.extras/tools/' \
      -e "s/load('lv2'/load('lv2', tooldir='tools'/" \
      -i wscript
  rm -rv waflib
}

build() {
  cd "$pkgname-$pkgver"
  waf configure --prefix=/usr
  waf build -vv
}

check() {
  cd "$pkgname-$pkgver"
  # the plugin names don't adhere to their project name, so for lv2lint tests they have to be copied in place
  cp -av "build/${pkgname//-/.}" "build/${pkgname}"
  LV2_PATH="${PWD}/build" lv2lint "https://github.com/blablack/midimsg-lv2/" || echo "Known to fail: https://github.com/blablack/midimsg-lv2/issues/1"
  rm -rv "build/${pkgname}"
  sord_validate "${PWD}/build/${pkgname//-/.}/"*.ttl || echo "Known to fail: https://github.com/blablack/midimsg-lv2/issues/1"
}

package() {
  cd "$pkgname-$pkgver"
  waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

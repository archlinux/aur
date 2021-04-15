# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=drops
_pkgver="1.0-beta"
pkgver="${_pkgver/-/}"
pkgrel=1
pkgdesc="A sample player instrument LV2/VST2 plugin and stand-alone JACK program"
arch=('x86_64')
url="https://github.com/clearly-broken-software/drops"
license=('GPL3')
depends=('gcc-libs')
makedepends=('jack2' 'libsndfile' 'mesa' 'sfizz')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/clearly-broken-software/${pkgname}/releases/download/v${_pkgver}/${pkgname}_v${_pkgver}.tar.gz"
        'drops-system-sfizz.patch')
md5sums=('65d6f03d60768858b52397d062526659'
         'b9be2ca33b9b7f322c34564659335fcd')

prepare() {
  cd "${srcdir}/${pkgname}_v${_pkgver}"

  # Use system-installed sfizz library
  patch -N -r - -p 1 -i "${srcdir}"/drops-system-sfizz.patch || :
}

build() {
  cd "${srcdir}/${pkgname}_v${_pkgver}"
  make
}

package() {
  depends+=('libjack.so' 'libsfizz.so' 'libsndfile.so')
  cd "${srcdir}/${pkgname}_v${_pkgver}"
  install -s -vDm 755 bin/drops -t "${pkgdir}"/usr/bin
  install -vDm 644 bin/drops.lv2/*.ttl -t "${pkgdir}"/usr/lib/lv2/drops.lv2
  install -vDm 755 bin/drops.lv2/*.so -t "${pkgdir}"/usr/lib/lv2/drops.lv2
  install -vDm 755 bin/drops-vst.so -t "${pkgdir}"/usr/lib/vst
}

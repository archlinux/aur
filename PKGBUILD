# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_plugin_uri='http://nickbailey.co.nr/triceratops'
pkgname=triceratops
pkgver=0.5.0
pkgrel=1
pkgdesc='Polyphonic synthesizer LV2 plugin'
arch=(aarch64 x86_64)
url='https://sourceforge.net/projects/triceratops/'
license=(GPL3)
groups=(lv2-plugins pro-audio)
depends=(gtkmm)
makedepends=(python lv2)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 plugin')
provides=($pkgname.lv2)
conflicts=($pkgname.lv2)
source=("https://downloads.sourceforge.net/project/triceratops/${pkgname}_v${pkgver}_Oct_2022.tar.gz"
        'triceratops-ttl.patch')
sha256sums=('93b2d74bb611fc3a26c2060ba678656b89d7ddba5b9e31e27a5758ec9924596e'
            '1083b10d0a004b3dd39afe37f6385d815e7cfdd26078aa7bcf85e2fc24afc262')

prepare() {
  cd $pkgname
  patch -p1 -N -r - -i "$srcdir"/triceratops-ttl.patch
}

build() {
  cd $pkgname
  python waf configure --prefix=/usr
  python waf
}

check() {
  cd $pkgname
  mkdir -p lv2
  ln -sf ../build/$pkgname.lv2 lv2/$pkgname.lv2
  LV2_PATH="$PWD/lv2:/usr/lib/lv2" lv2lint \
    -s _Z* \
    -s minBLEP_table \
    -M pack \
    "$_plugin_uri"
}

package() {
  cd $pkgname
  python waf install --destdir="$pkgdir"
}

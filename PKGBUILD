# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=vcf-lv2
pkgver=0.0.2
pkgrel=2
pkgdesc='VCF LV2 plugins'
arch=(x86_64 aarch64)
url='https://github.com/linuxmao-org/vcf-lv2'
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(lv2)
checkdepends=(lv2lint)
optdepends=('lv2-host: for running the plugins')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxmao-org/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4dc4c7eb3a81cfcbffaabe2c0bac229e6806f984140c6a0f4d0e74c988600bd7')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  _lv2_uri='http://jwm-art.net/lv2/vcf'
  for _plugin in plugins/*.lv2; do
    lv2lint -Mpack -I $_plugin \
      -t "Plugin Version *" \
      -t "Plugin Features" \
      $_lv2_uri/${_plugin:8:-8}{,_cv}
  done
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install-system
}

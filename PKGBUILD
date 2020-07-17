# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=LittleFly
pkgname=littlefly.lv2
pkgver=1.0
pkgrel=2
pkgdesc="A high gain overdrive/distortion pedal simulation LV2 plugin"
arch=('x86_64')
url="https://github.com/brummer10/${_name}.lv2"
license=('0BSD')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'libx11')
makedepends=('lv2')
checkdepends=('lv2lint' 'sord')
source=("https://github.com/brummer10/${_name}.lv2/releases/download/v${pkgver}/${_name}_${pkgver}.tar.gz"
        'littlefly-fix-ttl.diff')
sha512sums=('5782f0e5ba0ebde72f43f656253b8cc1fa1c78af9c7b6b276135d9e65a14c2ffc0b3476b367047a68417231d61ddd9496c3561793d34a6e5026eba7ead06bfd8'
            '37bb4708f89d07d7d6174ca6bfebf4e7b072f77580408a74df5ed5170f339e2d71b7122fed0c09aba64cbd59f318f3db5c4b5d455e87908d619afa993ef8ba36')

build() {
  cd "${srcdir}/${_name}_${pkgver}"
  make
}

prepare() {
  cd "${srcdir}/${_name}_${pkgver}"
  patch -p1 -N -i "${srcdir}/littlefly-fix-ttl.diff"
}

check() {
  cd "${srcdir}/${_name}_${pkgver}"
  mkdir -p lv2
  ln -sf ../${_name}/${_name}.lv2 lv2/${_name}.lv2
  # expected to produce errors
  #sord_validate -l "${PWD}/lv2/${_name}.lv2/"*.ttl
  LV2_PATH="${PWD}/lv2:/usr/lib/lv2" lv2lint -M pack "https://github.com/brummer10/${_name}.lv2#_${_name}_"
}

package() {
  cd "${srcdir}/${_name}_${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.md "${_name}.png" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

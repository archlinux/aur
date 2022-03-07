# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=rezonateur
pkgver=0.1.0
pkgrel=2
pkgdesc="A virtual-analog 3-band resonator audio effect LV2 and VST2 plugin and JACK client"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/rezonateur"
license=('Boost')
depends=('cairo')
makedepends=('mesa')
optdepends=('jack: support for stand-alone JACK client programs')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/jpcima/rezonateur/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'rezonateur-include-stdexcept.diff')
sha256sums=('466624147a22299c045e94b385b4f615f16dc91fcb208494c420bedb8e64fac9'
            '03f5b285b49c7753d8fce2e0efef33e834ca118056cbb9e80244091ff5c05b9c')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix for "runtime_error' is not a member of 'std'" error in newer gcc versions
  patch -N -r - -p 1 -i "$srcdir"/rezonateur-include-stdexcept.diff

  cd dpf
  patch -N -r - -p 1 -i ../resources/patch/DPF-bypass.patch || return 0
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create installation directories
  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}"/usr/lib/vst
  install -dm755 "${pkgdir}"/usr/lib/lv2/${pkgname}{-stereo,}.lv2
  # LV2 bundles
  install -Dm644 bin/${pkgname}.lv2/*.ttl -t \
    "${pkgdir}"/usr/lib/lv2/${pkgname}.lv2
  install -Dm755 bin/${pkgname}.lv2/*.so -t \
    "${pkgdir}"/usr/lib/lv2/${pkgname}.lv2
  install -Dm644 bin/${pkgname}-stereo.lv2/*.ttl -t \
    "${pkgdir}"/usr/lib/lv2/${pkgname}-stereo.lv2
  install -Dm755 bin/${pkgname}-stereo.lv2/*.so -t \
    "${pkgdir}"/usr/lib/lv2/${pkgname}-stereo.lv2
  # VST shared libraries
  install -m755 bin/${pkgname}{-stereo,}-vst.so "${pkgdir}"/usr/lib/vst
  # stand-alone JACK client binaries
  install -m755 bin/${pkgname}{-stereo,} "${pkgdir}"/usr/bin
}

# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=rezonateur
pkgname="${_pkgname}-git"
pkgver=0.1.0.r6.g58ccec5
pkgrel=1
pkgdesc="A virtual-analog 3-band resonator audio effect LV2 and VST2 plugin and JACK client (git version)"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/rezonateur"
license=('Boost')
depends=('cairo')
makedepends=('git' 'mesa')
optdepends=('jack: support for stand-alone JACK client programs')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jpcima/${_pkgname}.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # See https://github.com/jpcima/string-machine/issues/3#issuecomment-512590428
  git describe --long --exclude latest | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.dpf.url "${srcdir}/dpf"
  git submodule update

  cd dpf
  patch -N -r - -p 1 -i ../resources/patch/DPF-bypass.patch || :
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Create installation directories
  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}"/usr/lib/vst
  install -dm755 "${pkgdir}"/usr/lib/lv2/${_pkgname}{-stereo,}.lv2
  # LV2 bundles
  install -Dm644 bin/${_pkgname}.lv2/*.ttl -t \
    "${pkgdir}"/usr/lib/lv2/${_pkgname}.lv2
  install -Dm755 bin/${_pkgname}.lv2/*.so -t \
    "${pkgdir}"/usr/lib/lv2/${_pkgname}.lv2
  install -Dm644 bin/${_pkgname}-stereo.lv2/*.ttl -t \
    "${pkgdir}"/usr/lib/lv2/${_pkgname}-stereo.lv2
  install -Dm755 bin/${_pkgname}-stereo.lv2/*.so -t \
    "${pkgdir}"/usr/lib/lv2/${_pkgname}-stereo.lv2
  # VST shared libraries
  install -m755 bin/${_pkgname}{-stereo,}-vst.so "${pkgdir}"/usr/lib/vst
  # stand-alone JACK client binaries
  install -m755 bin/${_pkgname}{-stereo,} "${pkgdir}"/usr/bin
}

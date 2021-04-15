# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=drops
pkgname="${_pkgname}-git"
pkgver=0.3.alpha.r35.g6aad2c2
pkgrel=1
pkgdesc="A sample player instrument LV2/VST2 plugin and stand-alone JACK program (git version)"
arch=('x86_64')
url="https://github.com/clearly-broken-software/drops"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'jack2' 'libsndfile' 'mesa' 'sfizz')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/clearly-broken-software/${_pkgname}.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'nanosvg::git+https://github.com/memononen/nanosvg.git'
        'drops-system-sfizz.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'b9be2ca33b9b7f322c34564659335fcd')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Use system-installed sfizz library
  git submodule init
  git submodule deinit sfizz
  git config submodule.dpf.url "${srcdir}/dpf"
  git config submodule.external.url "${srcdir}/nanosvg"
  git submodule update

  patch -N -r - -p 1 -i "${srcdir}"/drops-system-sfizz.patch || :
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  depends+=('libjack.so' 'libsfizz.so' 'libsndfile.so')
  cd "${srcdir}/${_pkgname}"
  install -s -vDm 755 bin/drops -t "${pkgdir}"/usr/bin
  install -vDm 644 bin/drops.lv2/*.ttl -t "${pkgdir}"/usr/lib/lv2/drops.lv2
  install -vDm 755 bin/drops.lv2/*.so -t "${pkgdir}"/usr/lib/lv2/drops.lv2
  install -vDm 755 bin/drops-vst.so -t "${pkgdir}"/usr/lib/vst
}

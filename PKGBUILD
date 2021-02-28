# Maintainer: Milkii Brewster <milkii on Freenode IRC>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname='uhhyou.lv2'
pkgname="${_pkgname}-git"
pkgdesc="Various synth, effect and CV LV2 plugins."
pkgver=r511.df67460
pkgrel=1
arch=('x86_64')
url="https://github.com/ryukau/LV2Plugins"
license=('GPL3')
groups=('lv2-plugins')
depends=('glibc' 'libgl')
makedepends=('git' 'lv2' 'mesa')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/ryukau/LV2Plugins.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'vcl::git+https://github.com/vectorclass/version2.git'
        'pocketfft::git+https://gitlab.mpcdf.mpg.de/mtr/pocketfft.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.dpf.url "${srcdir}/dpf"
  git config submodule.vcl.url "${srcdir}/vcl"
  git config submodule.pocketfft.url "${srcdir}/pocketfft"
  git submodule update

  # cp patch/NanoVG.cpp lib/DPF/dgl/src/NanoVG.cpp
}

build() {
  cd "${srcdir}/${_pkgname}"
  make JACK=false VST2=false
}

package() {
  cd "${srcdir}/${_pkgname}"
  # LV2 bundles
  ( cd bin; \
    for plugin in *.lv2; do
      install -Dm755 "${plugin}"/*.so -t "${pkgdir}"/usr/lib/lv2/${plugin}
      install -Dm644 "${plugin}"/*.ttl -t "${pkgdir}"/usr/lib/lv2/${plugin}
    done;
  )
  # README
  install -Dm644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}

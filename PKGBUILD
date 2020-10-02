# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Milk Brewster <aurentry@milkmiruku.com>

_pkgname=element
pkgname="${_pkgname}-git"
pkgver=0.44.0.r69.g27a96e52
pkgrel=1
pkgdesc="A modular audio plugin host (git version)"
arch=('x86_64')
url="https://github.com/kushview/Element"
license=('GPL')
groups=('pro-audio')
depends=('gtk2')
makedepends=('alsa-lib' 'boost' 'curl' 'git' 'ladspa' 'lilv' 'lv2' 'python'
             'serd' 'sord' 'sratom' 'suil')
provides=("${_pkgname}" "libelement-0.so=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/kushview/Element.git"
        'kv-modules::git+https://github.com/kushview/kv-modules.git'
        'JUCE::git+https://github.com/WeAreRoli/JUCE.git'
        'jlv2::git+https://github.com/lvtk/jlv2.git'
        'lua-rt::git+https://github.com/kushview/lua-rt.git')
md5sums=('SKIP'
         'SKIP'
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
  git config submodule.kv.url "${srcdir}/kv-modules"
  git config submodule.JUCE.url "${srcdir}/JUCE"
  git config submodule.jlv2.url "${srcdir}/jlv2"
  git config submodule.lua-rt.url "${srcdir}/lua-rt"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  python ./waf configure --prefix=/usr
  python ./waf
}

package() {
  depends+=('libasound.so' 'libcurl.so' 'libjack.so' 'liblilv-0.so'
            'libserd-0.so' 'libsord-0.so' 'libsratom-0.so' 'libsuil-0.so')
  cd "${srcdir}/${_pkgname}"
  python ./waf install --destdir="${pkgdir}"
}

# Maintainer:  Dave <orangechannel@pm.me>

_plug=placebo
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r49.a8be164
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Lypheo/vs-placebo'
license=('LGPL')
depends=('vapoursynth')
makedepends=('git' 'meson' 'vulkan-headers' 'libplacebo-git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Lypheo/vs-placebo.git"
        "libp2p::git+https://github.com/sekrit-twc/libp2p.git"
        )
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mv libp2p "${_plug}"  # this should be done with submodules but I cant get it to work just yet
    cd "${_plug}"
#     git submodule init
#     git config submodule.libp2p.url "${_plug}/libp2p"
#     git submodule update
    
    arch-meson builddir
}

build() {
    cd "${_plug}"
    ninja -C builddir
}

# check() {
#     cd "${_plug}"
#     ninja -C builddir check  # is this deprecated??
# }

package(){
  cd "${_plug}"
  
  DESTDIR="${pkgdir}" ninja -C builddir install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

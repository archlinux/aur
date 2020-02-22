# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dragonfly-reverb
pkgname="${_pkgname}-git"
_name=DragonflyReverb
pkgver=3.0.0.r276.85dc8b8
pkgrel=1
pkgdesc="An algorithmic hall reverb and a room reverb (git version)"
arch=('i686' 'x86_64')
url="https://michaelwillis.github.io/dragonfly-reverb/"
license=('GPL3')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
depends=('freeverb3' 'jack' 'libglvnd')
makedepends=('gendesk' 'git' 'liblo' 'lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+https://github.com/michaelwillis/dragonfly-reverb.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
sha512sums=('SKIP' 'SKIP')

_reverbs=(
    "DragonflyEarlyReflections - A stereo-to-stereo reverb effect based on Moorer's early reflection model from Freeverb3"
    "DragonflyHallReverb - An algorithmic stereo-to-stereo reverb effect based on Hibiki Reverb from Freeverb3"
    "DragonflyPlateReverb - An algorithmic mono-to-stereo reverb effect based on NVerb and STRev from Freeverb3"
    "DragonflyRoomReverb - An algorithmic stereo-to-stereo reverb effect based on ProG Reverb from Freeverb3"
)


pkgver() {
  cd "${srcdir}/${_pkgname}"

  cat > version.c <<__EOF__
#include <stdio.h>
#include "DragonflyVersion.h"
void main() {
  printf("%d.%d.%d\n", MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION);
}
__EOF__
  gcc -I./common -o version version.c
  echo "$(./version).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.dpf.url "${srcdir}/dpf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  for _reverb in "${_reverbs[@]}"; do
    local _name="${_reverb%% - *}"
    local _desc="${_reverb#* - }"
    gendesk -f -n \
      --pkgname ${_name} \
      --pkgdesc "${_desc}" \
      --name ${_name} \
      --exec ${_name} \
      --categories "AudioVideo;Audio"
  done

  export SYSTEM_LIBSAMPLERATE="true"
  export SYSTEM_FREEVERB3="true"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  for _reverb in "${_reverbs[@]}"; do
    _reverb="${_reverb%% - *}"
    # Stand-alone JACK clients
    install -Dm 755 "bin/${_reverb}" -t "${pkgdir}/usr/bin"
    # Desktop integration
    install -Dm 644 "${_reverb}.desktop" -t "${pkgdir}/usr/share/applications"

    # VST2 plugins
    install -Dm 755 "bin/${_reverb}-vst.so" -t "${pkgdir}/usr/lib/vst"
    # LV2 bundles
    install -Dm 755 "bin/${_reverb}.lv2/"*.so \
      -t "${pkgdir}/usr/lib/lv2/${_reverb}.lv2/"
    install -Dm 644 "bin/${_reverb}.lv2/"*.ttl \
      -t "${pkgdir}/usr/lib/lv2/${_reverb}.lv2/"
  done

  # Documentation
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dragonfly-reverb
pkgname="${_pkgname}-git"
_name=DragonflyReverb
_reverbs=('DragonflyHallReverb' 'DragonflyRoomReverb')
pkgver=2.0.0.r232.16bcb09
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

  gendesk -f -n \
          --pkgname ${pkgname}-hall \
          --pkgdesc "An algorithmic stereo-to-stereo hall reverb effect" \
          --name DragonflyHallReverb \
          --exec DragonflyHallReverb \
          --categories "AudioVideo;Audio"
  gendesk -f -n \
          --pkgname ${pkgname}-room \
          --pkgdesc "An algorithmic stereo-to-stereo room reverb effect" \
          --name DragonflyRoomReverb \
          --exec DragonflyRoomReverb \
          --categories "AudioVideo;Audio"

  export SYSTEM_LIBSAMPLERATE="true"
  export SYSTEM_FREEVERB3="true"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  for _reverb in "${_reverbs[@]}"; do
    install -Dm 755 "bin/${_reverb}" -t "${pkgdir}/usr/bin"
    install -Dm 755 "bin/${_reverb}-vst.so" -t "${pkgdir}/usr/lib/vst"
    install -Dm 755 "bin/${_reverb}.lv2/"*.so \
      -t "${pkgdir}/usr/lib/lv2/${_reverb}.lv2/"
    install -Dm 644 "bin/${_reverb}.lv2/"*.ttl \
      -t "${pkgdir}/usr/lib/lv2/${_reverb}.lv2/"
  done

  install -Dm 644 *".desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

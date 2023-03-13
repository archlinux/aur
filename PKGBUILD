# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dragonfly-reverb
pkgname=$_pkgname-git
pkgver=3.2.8.r406.1771d76
pkgrel=1
pkgdesc='An algorithmic hall, plate, room and ER reverb (git version)'
arch=(x86_64)
url='https://michaelwillis.github.io/dragonfly-reverb/'
license=(GPL3)
groups=(pro-audio clap-plugins lv2-plugins vst-plugins vst3-plugins)
depends=(gcc-libs glibc libglvnd libx11)
makedepends=(freeverb3 gendesk git jack libsamplerate lv2)
checkdepends=(lv2lint)
optdepends=(
  'jack: for standalone applications'
  'clap-host: for CLAP plugins'
  'lv2-host: for LV2 plugins'
  'vst-host: for VST2 plugins'
  'vst3-host: for VST3 plugins'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/michaelwillis/dragonfly-reverb.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'pugl::git+https://github.com/DISTRHO/pugl.git')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

_reverbs=(
    "DragonflyEarlyReflections - A stereo-to-stereo reverb effect based on Moorer's early reflection model from Freeverb3"
    "DragonflyHallReverb - An algorithmic stereo-to-stereo reverb effect based on Hibiki Reverb from Freeverb3"
    "DragonflyPlateReverb - An algorithmic mono-to-stereo reverb effect based on NVerb and STRev from Freeverb3"
    "DragonflyRoomReverb - An algorithmic stereo-to-stereo reverb effect based on ProG Reverb from Freeverb3"
)


pkgver() {
  cd $_pkgname

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
  cd $_pkgname

  git submodule init
  git config submodule.dpf.url "$srcdir/dpf"
  git -c protocol.file.allow=always submodule update

  cd dpf

  git submodule init
  git config submodule.dgl.src.pugl-upstream.url "$srcdir/pugl"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pkgname

  declare -A _generic=(
    ["DragonflyEarlyReflections"]="Early Reflections Reverb"
    ["DragonflyHallReverb"]="Concert Hall Reverb"
    ["DragonflyPlateReverb"]="Plate Reverb"
    ["DragonflyRoomReverb"]="Room Reverb"
  )

  for _reverb in "${_reverbs[@]}"; do
    local _name="${_reverb%% - *}"
    local _desc="${_reverb#* - }"
    gendesk -f -n \
      --pkgname "io.github.michaelwillis.${_name}" \
      --name $_name \
      --exec $_name \
      --pkgdesc "$_desc" \
      --genericname "${generic[$name]}" \
      --categories "AudioVideo;Audio"
  done


  # explicitly remove vendored freeverb as it causes issues:
  # https://github.com/michaelwillis/dragonfly-reverb/issues/129
  rm -frv common/freeverb/

  export SYSTEM_LIBSAMPLERATE="true"
  export SYSTEM_FREEVERB3="true"
  make
}

# not working yet
check() {
  cd $_pkgname

  declare -A _plugin_uris=(
    ["DragonflyEarlyReflections"]='urn:dragonfly:early'
    ["DragonflyHallReverb"]='https://github.com/michaelwillis/dragonfly-reverb'
    ["DragonflyPlateReverb"]='urn:dragonfly:plate'
    ["DragonflyRoomReverb"]='urn:dragonfly:room'
  )

  for _reverb in "${_reverbs[@]}"; do
    local _name="${_reverb%% - *}"
    lv2lint -M pack \
      -s lv2_generate_ttl \
      -t "Plugin License" \
      -I "bin/$_name.lv2/" "${_plugin_uris[$_name]}"
  done
}

package() {
  depends+=('libfreeverb3.so')
  cd $_pkgname

  for _reverb in "${_reverbs[@]}"; do
    _reverb="${_reverb%% - *}"
    # Stand-alone JACK clients
    install -Dm 755 "bin/$_reverb" -t "$pkgdir"/usr/bin
    # Desktop integration
    install -Dm 644 "io.github.michaelwillis.$_reverb.desktop" \
      -t "${pkgdir}"/usr/share/applications
    # CLAP plugins
    install -Dm 755 bin/$_reverb.clap \
      -t "${pkgdir}"/usr/lib/clap
    # LV2 bundles
    install -Dm 755 bin/$_reverb.lv2/*.so \
      -t "${pkgdir}"/usr/lib/lv2/$_reverb.lv2/
    install -Dm 644 bin/$_reverb.lv2/*.ttl \
      -t "${pkgdir}"/usr/lib/lv2/$_reverb.lv2/
    # VST2 plugins
    install -Dm 755 bin/$_reverb-vst.so \
      -t "${pkgdir}"/usr/lib/vst
    # VST3 plugins
    install -Dm 755 bin/$_reverb.vst3/Contents/$(uname -m)-linux/$_reverb.so \
      -t "${pkgdir}"/usr/lib/vst3/$_reverb.vst3/Contents/$(uname -m)-linux
  done

  # Documentation
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  cp -r docs/* -t "$pkgdir"/usr/share/doc/$pkgname
}

# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ot-simian
pkgver=1.0.1
pkgrel=1
pkgdesc='Drum synthesizer inspired by the Simmons SDS-V'
arch=(x86_64)
url='https://punklabs.com/ot-simian'
license=(GPL3)
depends=(glibc gcc-libs libx11)
makedepends=(faust dub ldc)
optdepends=(
  'lv2-host: for LV2 plugin'
  'vst3-host: for VST3 plugin'
)
groups=(lv2-plugins pro-audio vst3-plugins)
source=("https://punklabs.com/content/projects/ot-simian/downloads/OneTrick-SIMIAN-${pkgver}-Source.zip"
        'Dplug::git+https://github.com/AuburnSounds/Dplug.git')
sha256sums=('9bb042073a38a1c465ed4e7ed2347711c0ab83853abe341f2b8e2f652a17949e'
            'SKIP')


build() {
  # FIXME: dplug-build should be packaged separately
  cd Dplug/tools/dplug-build
  dub --cache=local --compiler ldc2 #--skip-registry=all

  cd "$srcdir"/plugin
  ln -sf "$srcdir"/Dplug/tools/dplug-build/dplug-build

  faust --process-name processDrum -lang dlang -A "DSP/arch" \
    -a custom.d.template -o "DSP_Drum.d" --class-name DSP_Drum \
    "DSP/Simian.dsp"
  faust --process-name processOutput -lang dlang -A "DSP/arch" \
    -a custom.d.template -o "DSP_Output.d" --class-name DSP_Output \
    "DSP/Simian.dsp"

  # FIXME: second build fails with a bunch of conflicts. Need to investigate.
  rm -rf .dub/build
  # HACK: setting HOME to cause dub to write its cache to cwd 
  HOME=$(pwd) ./dplug-build --build release --config LV2 --config VST3
}

package() {
  cd plugin
  local plugin_name="Punk Labs LLC OneTrick SIMIAN"
  
  # LV2 plugin bundle
  local lv2_name="$plugin_name.lv2"
  install -Dm644 "builds/Linux-64b-LV2/$lv2_name"/*.ttl \
    -t "$pkgdir/usr/lib/lv2/$lv2_name"
  install -Dm755 "builds/Linux-64b-LV2/$lv2_name"/*.so \
    -t "$pkgdir/usr/lib/lv2/$lv2_name"
  # VST3 plugin bundle
  local vst3_dir="$plugin_name.vst3/Contents/$(uname -m)-linux"
  install -Dm755 "builds/Linux-64b-VST3/$vst3_dir/$plugin_name.so" \
    -t "$pkgdir/usr/lib/vst3/$vst3_dir"
}

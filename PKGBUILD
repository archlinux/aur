# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ot-simian
pkgver=1.0.0
pkgrel=1
pkgdesc='Drum synthesizer inspired by the Simmons SDS-V'
arch=(x86_64)
url='https://punklabs.com/ot-simian'
license=(GPL3)
depends=(glibc gcc-libs libx11)
makedepends=(faust dub ldc)
groups=(lv2-plugins pro-audio)
source=("https://punklabs.com/content/projects/ot-simian/downloads/OneTrick-SIMIAN-${pkgver}-Source.zip"
        'Dplug::git+https://github.com/AuburnSounds/Dplug.git')
sha256sums=('7c046141a763ca5ca5324e38fa4bdaf347770e94ca848c1a97a4396cb8223b27'
            'SKIP')


build() {
  # FIXME: dplug-build should be packaged separately
  cd Dplug/tools/dplug-build
  dub --compiler ldc2

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
  ./dplug-build --build release --config LV2 --config VST3
}

package() {
  cd plugin

  local plugin_name="Punk Labs LLC OneTrick SIMIAN"
  local bundle_name="$plugin_name.lv2"
  install -dm755 "$pkgdir/usr/lib/lv2/$bundle_name"
  install -Dm644 "builds/Linux-64b-LV2/$bundle_name"/*.ttl \
    -t "$pkgdir/usr/lib/lv2/$bundle_name"
  install -Dm755 "builds/Linux-64b-LV2/$bundle_name"/*.so \
    -t "$pkgdir/usr/lib/lv2/$bundle_name"

  # FIXME use install
  local bundle_name="$plugin_name.vst3"
  mkdir -p "$pkgdir/usr/lib/vst3"
  cp -r "builds/Linux-64b-VST3/$bundle_name" "$pkgdir/usr/lib/vst3/$bundle_name"
}

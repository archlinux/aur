# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=ot-simian
pkgver=1.1.0
pkgrel=1
pkgdesc='Drum synthesizer inspired by the Simmons SDS-V'
arch=(aarch64 x86_64)
url='https://punklabs.com/ot-simian'
license=(GPL3)
depends=(gcc-libs libx11)
makedepends=(dub faust ldc python)
optdepends=(
  'lv2-host: for LV2 plugin'
  'vst3-host: for VST3 plugin'
)
groups=(lv2-plugins pro-audio vst3-plugins)
source=("https://punklabs.com/content/projects/ot-simian/downloads/OneTrick-SIMIAN-${pkgver}-Source.zip"
        'generate-manifest-ttl.py')
sha256sums=('ef84e856a3b9579cfa1b43c840d758d490accd0ef478cfd55318c2a60e897b66'
            '261c2bfe8c692ce7df4d376b869cb832d5b3a668d3960cfef62f52d2a39d0f6f')
noextract=("OneTrick-SIMIAN-${pkgver}-Source.zip")

_plugin_name="Punk Labs LLC OneTrick SIMIAN"
_lv2_name="$_plugin_name.lv2"
_lv2_libname="${_plugin_name// /}.so"
_vst3_libpath="$_plugin_name.vst3/Contents/$(uname -m)-linux"
_vst3_libname="$_plugin_name.so"


prepare() {
  mkdir -p OneTrick-SIMIAN-${pkgver}
  bsdtar -xf "$srcdir"/OneTrick-SIMIAN-${pkgver}-Source.zip -C OneTrick-SIMIAN-${pkgver}

  cd "$srcdir"/OneTrick-SIMIAN-${pkgver}
  # make dub build use LDFLAGS
  if ! grep -q -- -Wl dub.json; then
    sed -i -Ee 's@"lflags-linux-ldc": \[(.*)]@"lflags-linux-ldc": [ \1, "'$LDFLAGS'" ]@' dub.json
  fi
}

build() {
  cd "$srcdir"/OneTrick-SIMIAN-${pkgver}
  # Generate D sources from FAUST .dsp files
  faust \
    --process-name processDrum \
    -lang dlang \
    -A "OneTrick/DSP" \
    -a arch.fastmath.d.template \
    -o DSP/Generated/DSP_Drum.d \
    --class-name DSP_Drum "DSP/Main.dsp"
  faust \
    --process-name processOutput \
    -lang dlang \
    -A "OneTrick/DSP" \
    -a arch.fastmath.d.template \
    -o "DSP/Generated/DSP_Output.d" \
    --class-name DSP_Output "DSP/Main.dsp"
  # Build LV2 plugin
  dub build --build=release-nobounds --arch=$CARCH --compiler=ldc2 --combined --config=LV2
  mkdir -p "$_lv2_name"
  mv libonetrick_simian.so "$_lv2_name/$_lv2_libname"
  python "$srcdir"/generate-manifest-ttl.py "$_lv2_name/$_lv2_libname" "$_lv2_name" "$_lv2_libname"
  # Build VST3 plugin
  dub build --build=release-nobounds --arch=$CARCH --compiler=ldc2 --combined --config=VST3
  mv libonetrick_simian.so "$_vst3_libname.so"
}

package() {
  cd OneTrick-SIMIAN-${pkgver}
  # LV2 plugin bundle
  install -Dm644 "$_lv2_name"/*.ttl -t "$pkgdir/usr/lib/lv2/$_lv2_name"
  install -Dm755 "$_lv2_name"/*.so -t "$pkgdir/usr/lib/lv2/$_lv2_name"
  # VST3 plugin bundle
  install -Dm755 "$_vst3_libname.so" -t "$pkgdir/usr/lib/vst3/$_vst3_libpath"
}

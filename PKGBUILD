# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=ot-simian
pkgver=1.0.0
pkgrel=1
pkgdesc='Drum synthesizer inspired by the Simmons SDS-V'
arch=('any')
url='https://punklabs.com/ot-simian'
license=('GPL3')
makedepends=('faust' 'dub' 'ldc')
source=("https://punklabs.com/content/projects/ot-simian/downloads/OneTrick-SIMIAN-${pkgver}-Source.zip")
sha256sums=('7c046141a763ca5ca5324e38fa4bdaf347770e94ca848c1a97a4396cb8223b27')

build() {
  cd "plugin"
  faust --process-name processDrum -lang dlang -A "DSP/arch" -a custom.d.template -o "DSP_Drum.d" --class-name DSP_Drum "DSP/Simian.dsp"
  faust --process-name processOutput -lang dlang -A "DSP/arch" -a custom.d.template -o "DSP_Output.d" --class-name DSP_Output "DSP/Simian.dsp"

  # FIXME dplug-build should be packaged separately
  rm -rf Dplug
  git clone https://github.com/AuburnSounds/Dplug.git Dplug
  pushd Dplug/tools/dplug-build
  dub --compiler ldc2
  popd
  cp Dplug/tools/dplug-build/dplug-build ./
  rm -rf Dplug

  ./dplug-build --build debug --config LV2
}

package() {
  cd "plugin"

  # FIXME use install command
  mkdir -p "$pkgdir/usr/lib/lv2/"
  cp -r --preserve=mode \
    'builds/Linux-64b-LV2/Punk Labs LLC OneTrick SIMIAN.lv2' \
    "$pkgdir/usr/lib/lv2/Punk Labs LLC OneTrick SIMIAN.lv2"
}

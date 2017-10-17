# Maintainer: gato_lento <vukk.euob at gmail>
# Based on helm-git PKGBUILD by: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=helm
pkgver=0.9.0
pkgrel=1
pkgdesc="a cross-platform, polyphonic synthesizer, available standalone and as LV2 and VST plugins"
arch=('i686' 'x86_64')
url="http://tytel.org/helm/"
license=('GPL')
groups=('lv2-plugins' 'vst-plugins')
depends=('alsa-lib' 'freetype2' 'mesa' 'lv2')
makedepends=('steinberg-vst36')
source=("https://github.com/mtytel/helm/archive/v0.9.0.tar.gz")
sha256sums=('4004c11fd1d773cc2a12adb5336873bc86c5ecbd370b8da2820fed6ef5ec58ad')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg2 "Fixing Makefiles..."
  sed -i -e "s|-I ~/srcs/VST3\\\\ SDK||" \
    builds/linux/VST/Makefile

  for build in standalone/builds/linux builds/linux/VST builds/linux/LV2; do
    sed -i -e 's|JUCE_INCLUDE_PNGLIB_CODE=0|JUCE_INCLUDE_PNGLIB_CODE=1|g' \
      "${build}/Makefile"
  done

  msg2 "Fixing VST3 SDK include paths in JUCE sources..."
  for file in \
      JUCE/extras/Projucer/Source/Utility/jucer_StoredSettings.cpp \
      JUCE/modules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp \
      JUCE/modules/juce_audio_processors/format_types/juce_VST3Headers.h; do
    sed -i -e 's|public.sdk/source/vst2.x|vst36|g' "$file"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make PREFIX="/usr" all vst
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make DESTDIR="$pkgdir" install
  install -D builds/linux/VST/build/helm.so "$pkgdir/usr/lib/vst/helm.so"
}

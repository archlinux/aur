# Maintainer: gato_lento <vukk.euob at gmail>
# Based on helm-git PKGBUILD by: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='helm-vst'
_pkgname='helm'
pkgver=0.9.0
pkgrel=2
pkgdesc='a cross-platform, polyphonic synthesizer VST plugin'
arch=('x86_64')
url='http://tytel.org/helm/'
license=('GPL')
groups=('vst-plugins')
depends=('alsa-lib' 'freetype2' 'mesa')
makedepends=('steinberg-vst36')
source=("https://github.com/mtytel/helm/archive/v${pkgver}.tar.gz"
        gcc9.patch)
sha256sums=('4004c11fd1d773cc2a12adb5336873bc86c5ecbd370b8da2820fed6ef5ec58ad'
            '1ffbd24a9e0b5631475eecccd0f6d5c6985a3c2100ef27f94481adae909d9869')
conflicts=('helm')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/gcc9.patch"

  msg2 "Fixing Makefiles..."
  sed -i -e "s|-I ~/srcs/VST3\\\\ SDK||" \
    builds/linux/VST/Makefile

  msg2 "Fixing VST3 SDK include paths in JUCE sources..."
  for file in \
      JUCE/extras/Projucer/Source/Utility/jucer_StoredSettings.cpp \
      JUCE/modules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp \
      JUCE/modules/juce_audio_processors/format_types/juce_VST3Headers.h; do
    sed -i -e 's|public.sdk/source/vst2.x|vst36|g' "$file"
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make vst
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make DESTDIR="$pkgdir" install_patches
  install -D builds/linux/VST/build/helm.so "${pkgdir}/usr/lib/vst/helm.so"
}

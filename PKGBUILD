# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=tunefish4
pkgver=4.1.0
pkgrel=1
pkgdesc="An additive wavetable-based synthesizer VST plugin"
arch=('x86_64')
url="http://www.tunefish-synth.com/"
# See https://github.com/paynebc/tunefish/blob/master/COPYING
license=("GPL3")
groups=('vst-plugins')
depends=('alsa-lib' 'freetype2' 'libglvnd')
source=("https://github.com/paynebc/tunefish/archive/RELEASE_${pkgver//./_}.tar.gz")
sha256sums=('89e549acbdc4dc1f5bf094b6ee3968d8adb651b5078da4057f814617ca307b42')


prepare() {
  cd "${srcdir}/tunefish-RELEASE_${pkgver//./_}/src/tunefish4"

  msg2 "Fixing VST3 SDK include paths in JUCE sources..."
  for file in \
      JuceLibraryCode/modules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp \
      JuceLibraryCode/modules/juce_audio_plugin_client/VST3/juce_VST3_Wrapper.cpp \
      JuceLibraryCode/modules/juce_audio_processors/format_types/juce_VSTPluginFormat.cpp; do
    sed -i -e 's|public.sdk/source/vst2.x|vst36|g' "$file"
  done
}

build() {
  cd "${srcdir}/tunefish-RELEASE_${pkgver//./_}/src/tunefish4"

  #~Projucer --resave Tunefish4.jucer
  cd Builds/LinuxMakefile
  export CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND"
  make
}

package() {
  cd "${srcdir}/tunefish-RELEASE_${pkgver//./_}"

  install -dm755 "${pkgdir}/usr/lib/vst/tf4programs"
  install -m755 src/tunefish4/Builds/LinuxMakefile/build/Tunefish4.so "${pkgdir}/usr/lib/vst"
  install -m644 "patches/tf4programs/"* "${pkgdir}/usr/lib/vst/tf4programs"
}

# vim:set ts=2 sw=2 et:

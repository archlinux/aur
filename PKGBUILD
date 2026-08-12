# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-speceq'
pkgname=('zl-speceq-vst3' 'zl-speceq-lv2' 'zl-speceq')
pkgver='0.0.2'
pkgrel=2
pkgdesc='Dynamic spectrum equalizer audio plugin'
arch=('x86_64' 'aarch64')
url='https://zl-audio.github.io/plugins/zlspeceq/'
license=('AGPL-3.0-only')
groups=('pro-audio' 'zl-audio')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'highway'
  'libx11'
  'libxcomposite'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxrandr'
  'libxrender'
)
makedepends=(
  'clang'
  'cmake'
  'ninja'
)

_jucecommit=176e4108cd86190681e96af76bfbe0d62de898da
_fftcommit=515059f972572b684e51b6afe09f62636b767b22

source=(
  "${pkgbase}_${pkgver}.zip::https://github.com/ZL-Audio/ZLSpectrumEqualizer/archive/refs/tags/${pkgver}.zip"
  "juce_${_jucecommit}.zip::https://github.com/ZL-Audio/JUCE/archive/${_jucecommit}.zip"
  "zldsp_fft_${_fftcommit}.zip::https://github.com/ZL-Audio/zldsp_fft/archive/${_fftcommit}.zip"
)
sha256sums=('64fbd914261701dd45e0d1431116b1ba02e3b93f2f5536de68b7d5e20e5f21c7'
            'bb76b0a5401606c1db2e7f4907512ce2520c9a6334fa690b5cc71c2b26b983bf'
            '98e9b99ec4dbc758f88fbdb98dda210bbda2f4abd98fa61846c9e4a8c77867ec')

prepare() {
  cd "ZLSpectrumEqualizer-${pkgver}/"

  # These need to be a subdirectory for makepkg to pick it up.
  # Would it be better to set them as noextract and then manually unzip them to
  # the correct palce?
  # Alternatively we could extract them to the normal location and then re-write
  # the cmake build file to search for them there instead of moving them
  # in-tree.
  rm -rf JUCE
  mv ../JUCE-${_jucecommit} JUCE
  rm -rf zldsp_fft
  mv ../zldsp_fft-${_fftcommit} zldsp_fft

  # Use system libraries
  sed 's|add_subdirectory(highway)|find_package(hwy CONFIG REQUIRED)|' -i CMakeLists.txt
}

build() {
  cd "ZLSpectrumEqualizer-${pkgver}/"

  local CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}"

  cmake -B Builds -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" \
    -DZL_HWY_STATIC_TARGET="AVX2" -DCMAKE_BUILD_TYPE=Release .
  cmake --build Builds --config Release
}

package_zl-speceq-vst3() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'

  cd "ZLSpectrumEqualizer-${pkgver}/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r Builds/ZLSpectrumEqualizer_artefacts/Release/VST3/* "${pkgdir}/usr/lib/vst3"
}

package_zl-speceq-lv2() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'

  cd "ZLSpectrumEqualizer-${pkgver}/"
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  cp -r Builds/ZLSpectrumEqualizer_artefacts/Release/LV2/* "${pkgdir}/usr/lib/lv2"
}

package_zl-speceq() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-speceq-vst3' 'zl-speceq-lv2')
}

# vim:set ts=2 sw=2 et:

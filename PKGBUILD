# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-speceq'
pkgname=('zl-speceq-vst3' 'zl-speceq-lv2' 'zl-speceq')
pkgver='0.0.1'
pkgrel=2
pkgdesc='Dynamic spectrum equalizer audio plugin'
arch=('x86_64' 'aarch64')
url='https://zl-audio.github.io/plugins/zlspeceq/'
license=('AGPL-3.0-only')
groups=('pro-audio' 'zl-audio')
depends=(
  'alsa-lib'
  'libx11'
  'libxcomposite'
  'libxcursor'
  'libxext'
  'libxinerama'
  'libxrandr'
  'libxrender'
  'freetype2'
  'fontconfig'
  'libxi'
)
makedepends=(
  'ninja'
  'clang'
  'cmake'
)

_jucecommit=176e4108cd86190681e96af76bfbe0d62de898da
_fftcommit=0215d7e7ee7a338ea3bda855d1bd1cec50aaa922

source=(
  "https://github.com/ZL-Audio/ZLSpectrumEqualizer/archive/refs/tags/${pkgver}.zip"
  "https://github.com/ZL-Audio/JUCE/archive/${_jucecommit}.zip"
  "https://github.com/ZL-Audio/zldsp_fft/archive/${_fftcommit}.zip"
)
sha256sums=('84029dd4f83f96f33d02a1b8d7d1c21e9bc9e90cffd3cf7544ac7857e8bac8a4'
            'bb76b0a5401606c1db2e7f4907512ce2520c9a6334fa690b5cc71c2b26b983bf'
            '85c5b8f8c8f436ef2402a6bb53204f07d3f5b2bad2ec804fef44317465cfad98')

prepare() {
  cd "ZLSpectrumEqualizer-${pkgver}/"

  # These need to be a subdirectory for makepkg to pick it up.
  # Would it be better to set them as noextract and then manually unzip them to
  # the correct palce?
  rm -rf JUCE
  rm -rf source/dsp/fft/zldsp_fft
  mv ../JUCE-${_jucecommit} JUCE
  mv ../zldsp_fft-${_fftcommit} source/dsp/fft/zldsp_fft

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
  mkdir -p ${pkgdir}/usr/lib/vst3/
  cp -r Builds/ZLSpectrumEqualizer_artefacts/Release/VST3/* ${pkgdir}/usr/lib/vst3
}

package_zl-speceq-lv2() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'

  cd "ZLSpectrumEqualizer-${pkgver}/"
  mkdir -p ${pkgdir}/usr/lib/lv2/
  cp -r Builds/ZLSpectrumEqualizer_artefacts/Release/LV2/* ${pkgdir}/usr/lib/lv2
}

package_zl-speceq() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-speceq-vst3' 'zl-speceq-lv2')
}

# vim:set ts=2 sw=2 et:

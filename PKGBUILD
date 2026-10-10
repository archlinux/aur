# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-speceq'
pkgname=('zl-speceq-vst3' 'zl-speceq-lv2' 'zl-speceq')
pkgver='0.1.1'
pkgrel=1
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

_jucecommit=e66b82515320d92a2224651f8ecc1c888a8ec3d8
_fftcommit=b741fb7ac6ecdb9ea935730aa34fa89602f3e52f

source=(
  "${pkgbase}_${pkgver}.zip::https://github.com/ZL-Audio/ZLSpectrumEqualizer/archive/refs/tags/${pkgver}.zip"
  "juce_${_jucecommit}.zip::https://github.com/ZL-Audio/JUCE/archive/${_jucecommit}.zip"
  "zldsp_fft_${_fftcommit}.zip::https://github.com/ZL-Audio/zldsp_fft/archive/${_fftcommit}.zip"
)
sha256sums=('7377600949dfe070d8e69528838c0ad2869ffac3d07c206288a8ffb8edd3520b'
            '6a4189e1f3fc77ca9ff067966690f7a17ffaaee605e6711074fa6b72ef144cfd'
            'c09372903a4d789656b82c7a248ec5c4b38fdd8b8b6786beac7973a62cc6abe7')

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
  local cmake_options=(
    -B "${srcdir}/ZLSpectrumEqualizer-${pkgver}/Builds"
    -S "${srcdir}/ZLSpectrumEqualizer-${pkgver}/"
    -G Ninja
    -W no-author
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_C_COMPILER=clang
    -DCMAKE_CXX_COMPILER=clang++
    -DCMAKE_C_FLAGS="$CFLAGS"
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
    -DCMAKE_SKIP_INSTALL_RPATH=YES
    -DZL_JUCE_COPY_PLUGIN=FALSE
    -DZL_JUCE_FORMATS="VST3;LV2"
    -DZL_HWY_STATIC_TARGET="AVX2"
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build "${srcdir}/ZLSpectrumEqualizer-${pkgver}/Builds"
}

package_zl-speceq-vst3() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'

  cd "ZLSpectrumEqualizer-${pkgver}/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r Builds/ZLSpectrumEqualizer_artefacts/None/VST3/* "${pkgdir}/usr/lib/vst3"
}

package_zl-speceq-lv2() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'

  cd "ZLSpectrumEqualizer-${pkgver}/"
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  cp -r Builds/ZLSpectrumEqualizer_artefacts/None/LV2/* "${pkgdir}/usr/lib/lv2"
}

package_zl-speceq() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-speceq-vst3' 'zl-speceq-lv2')
}

# vim:set ts=2 sw=2 et:

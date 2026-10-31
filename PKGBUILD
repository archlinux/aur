# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-limiter'
pkgname=('zl-limiter-vst3' 'zl-limiter-lv2' 'zl-limiter')
pkgver='0.0.1'
pkgrel=1
pkgdesc='Dynamic spectrum equalizer audio plugin'
arch=('x86_64' 'aarch64')
url='https://zl-audio.github.io/plugins/zllimiter/'
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

_jucecommit=388cba6a326c0704e58ba74b866309d5f775f2d6

source=(
  "${pkgbase}_${pkgver}.zip::https://github.com/ZL-Audio/ZLLimiter/archive/refs/tags/${pkgver}.tar.gz"
  "juce_${_jucecommit}.zip::https://github.com/ZL-Audio/JUCE/archive/${_jucecommit}.zip"
)
sha256sums=('f5b2898c872326e27c05af56016a20c2d4626210ec08372984c38b7c067ec223'
            'a42f50c1cdc19ecf047f5e97c92750b863d35dd69a9006e2727ed2508645bd7e')

prepare() {
  cd "ZLLimiter-${pkgver}/"

  # These need to be a subdirectory for makepkg to pick it up.
  # Would it be better to set them as noextract and then manually unzip them to
  # the correct palce?
  # Alternatively we could extract them to the normal location and then re-write
  # the cmake build file to search for them there instead of moving them
  # in-tree.
  rm -rf JUCE
  mv ../JUCE-${_jucecommit} JUCE

  # Use system libraries
  sed 's|add_subdirectory(highway)|find_package(hwy CONFIG REQUIRED)|' -i CMakeLists.txt
}

build() {
  cd "ZLLimiter-${pkgver}/"

  local CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}"
  local cmake_options=(
    -B "${srcdir}/ZLLimiter-${pkgver}/Builds"
    -S "${srcdir}/ZLLimiter-${pkgver}/"
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
  cmake --build "${srcdir}/ZLLimiter-${pkgver}/Builds"
}

package_zl-limiter-vst3() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'

  cd "ZLLimiter-${pkgver}/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r Builds/ZLLimiter_artefacts/None/VST3/* "${pkgdir}/usr/lib/vst3"
}

package_zl-limiter-lv2() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'

  cd "ZLLimiter-${pkgver}/"
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  cp -r Builds/ZLLimiter_artefacts/None/LV2/* "${pkgdir}/usr/lib/lv2"
}

package_zl-limiter() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-limiter-vst3' 'zl-limiter-lv2')
}

# vim:set ts=2 sw=2 et:

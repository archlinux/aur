# Maintainer: Sam Whited <sam@samwhited.com>

pkgname='jsinflator-vst3'
pkgver='2.0.3.2'
pkgrel=2
pkgdesc='Open source copy of Sonox Inflator'
arch=('x86_64')
url='https://github.com/Kiriki-liszt/JS_Inflator'
license=('GPL-3.0-only')
groups=('pro-audio' 'vst3-plugins')
depends=(
)
makedepends=(
  'clang'
  'cmake'
  'vst3sdk'
  'wayland-protocols'
)

_r8brainver='version-6.5'

source=(
  "${pkgname}_${pkgver}.zip::https://github.com/Kiriki-liszt/JS_Inflator/archive/refs/tags/v${pkgver}.zip"
  "r8brain_${_r8brainver}.zip::https://github.com/avaneev/r8brain-free-src/archive/refs/tags/${_r8brainver}.zip"
)
sha256sums=('af8038547b45214314bd69cc7f48d6622592a43f52392cb8b18367e39fa6654f'
            '1b067d16e55ea498c8dc80a86575d5fc53f54bd0cfa207ec7c51c383c23b5e9e')

prepare() {
  rm -rf "JS_Inflator-${pkgver}/libs/r8brain-free-src"
  mv "r8brain-free-src-${_r8brainver}" "JS_Inflator-${pkgver}/libs/r8brain-free-src"
}

build() {
  cd "JS_Inflator-${pkgver}/"

  local CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}"

  cmake -B Builds \
    -DSMTG_LINUX=ON \
    -DSMTG_RUN_VST_VALIDATOR=OFF \
    -DSMTG_ENABLE_WAYLAND_SUPPORT=ON \
    -DSMTG_CREATE_PLUGIN_LINK=OFF \
    -DSMTG_ENABLE_VST3_PLUGIN_EXAMPLES=OFF \
    -DSMTG_ENABLE_VST3_HOSTING_EXAMPLES=OFF \
    -DSMTG_MDA_VST3_VST2_COMPATIBLE=OFF \
    -DSMTG_CREATE_BUNDLE_FOR_WINDOWS=OFF \
    -Dvst3sdk_SOURCE_DIR=/usr/src/vst3sdk \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DCMAKE_BUILD_TYPE=Release .

  cmake --build Builds --config Release
}

package() {
  cd "JS_Inflator-${pkgver}/"

  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r Builds/VST3/Release/JS_Inflator.vst3 "${pkgdir}/usr/lib/vst3"
}

# vim:set ts=2 sw=2 et:

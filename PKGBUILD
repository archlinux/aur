# Maintainer: Tolga Hosgor <fasdfasdas@gmail.com>

_pkgname=('ogre-next')
pkgname=("$_pkgname-git")
pkgver=r12498.507f6bbf0
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('i686' 'x86_64')
url='http://ogre3d.org'
license=('MIT')
depends=(
  'freeimage'
  'freetype2'
  'glu'
  'libxaw'
  'libxrandr'
  'rapidjson'
  'tinyxml'
  'zziplib'
)
makedepends=(
  'cmake'
  'git'
  'mesa'
  'vulkan-headers'
)
provides=('ogre')
conflicts=('ogre')
source=("git+https://github.com/OGRECave/$_pkgname.git")
sha512sums=('SKIP')

prepare() {
  cd "$_pkgname"
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # Silence warnings about deprecated declarations
  CXXFLAGS+=' -Wno-deprecated-declarations -Wno-deprecated-copy'

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_BUILD_COMPONENT_HLMS_PBS:BOOL=TRUE \
    -DOGRE_BUILD_COMPONENT_HLMS_UNLIT:BOOL=TRUE \
    -DOGRE_BUILD_COMPONENT_MESHLODGENERATOR:BOOL=TRUE \
    -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL=TRUE \
    -DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS:BOOL=TRUE \
    -DOGRE_BUILD_COMPONENT_TERRAIN:BOOL=FALSE \
    -DOGRE_BUILD_COMPONENT_VOLUME:BOOL=FALSE \
    -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS:BOOL=TRUE \
    -DOGRE_BUILD_RENDERSYSTEM_VULKAN:BOOL=TRUE \
    -DOGRE_BUILD_SAMPLES2:BOOL=TRUE \
    -DOGRE_BUILD_TESTS:BOOL=FALSE \
    -DOGRE_CONFIG_ENABLE_FREEIMAGE:BOOL=TRUE \
    -DOGRE_CONFIG_ENABLE_JSON:BOOL=TRUE \
    -DOGRE_CONFIG_ENABLE_ZIP:BOOL=TRUE \
    -DOGRE_CONFIG_THREAD_PROVIDER=std \
    -DOGRE_INSTALL_DOCS=0 \
    -DOGRE_INSTALL_SAMPLES:BOOL=TRUE \
    -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=TRUE \
    -DOGRE_INSTALL_TOOLS:BOOL=TRUE \
    -DOGRE_SIMD_NEON:BOOL=FALSE \
    -DOGRE_USE_BOOST=0

  make
}

package() {
  optdepends=('cppunit: unit testing'
              'intel-tbb: better threading support'
              'poco: portability'
              'boost: for developing using ogre')

  cd "$_pkgname/build"

  make DESTDIR="${pkgdir}/" install

  install -Dm644 ../Docs/License.html "${pkgdir}/usr/share/licenses/${_pkgname}/license.html"
}

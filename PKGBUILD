# Maintainer: oysstu <oysstu at gmail dot com>
# Contributor: Tolga Hosgor <fasdfasdas@gmail.com>

_pkgname=('ogre-next')
pkgname=("gz-$_pkgname")
pkgver=2.3.1
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++. Gazebo compatible.'
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
  'sdl2'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
  'mesa'
  'vulkan-headers'
  'git'
)
provides=('ogre-next')
source=("git+https://github.com/OGRECave/$_pkgname.git#tag=v${pkgver}")
sha512sums=('SKIP')

_build_dir="$_pkgname/build"

prepare() {
  cd "$_pkgname"
  git cherry-pick -n "4b3b8d03b5b76a7b04fc8c437a040b2d0be181eb"
  git cherry-pick -n "ee31a07b7b361ee8cb25568bc08bbc70af95febb"
  git cherry-pick -n "558115e3503ec78861b64a33a2867e581de2bc0f"
  git cherry-pick -n "9474ee85390166544b4219992e8891ec0ec21273"
}

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake ..  -DCMAKE_BUILD_TYPE='Release' \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DOGRE_CONFIG_ENABLE_JSON:BOOL=TRUE \
            -DOGRE_CONFIG_ENABLE_ZIP:BOOL=TRUE \
            -DOGRE_CONFIG_ENABLE_FREEIMAGE:BOOL=TRUE \
            -DOGRE_CONFIG_THREADS=1 \
            -DOGRE_CONFIG_THREAD_PROVIDER="std" \
            -DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_PROPERTY:BOOL=FALSE \
            -DOGRE_BUILD_COMPONENT_SCENE_FORMAT:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_HLMS_PBS:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_HLMS_UNLIT:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_MESHLODGENERATOR:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_TERRAIN:BOOL=FALSE \
            -DOGRE_BUILD_COMPONENT_VOLUME:BOOL=FALSE \
            -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS:BOOL=TRUE \
            -DOGRE_BUILD_RENDERSYSTEM_VULKAN:BOOL=TRUE \
            -DOGRE_BUILD_TESTS:BOOL=FALSE \
            -DOGRE_BUILD_SAMPLES2:BOOL=FALSE \
            -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=FALSE \
            -DOGRE_INSTALL_DOCS:BOOL=FALSE \
            -DOGRE_INSTALL_SAMPLES:BOOL=FALSE \
            -DOGRE_USE_NEW_PROJECT_NAME:BOOL=TRUE \
            -DOGRE_USE_BOOST:BOOL=FALSE

  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}

# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=olive
pkgname=$_pkgname-git
pkgver=continuous.r2477.gaa6b77f80
pkgrel=1
arch=('x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg4.4' 'libolivecore' 'openimageio' 'opentimelineio0.14' 'portaudio' 'qt6-base')
makedepends=('cmake' 'git' 'ninja' 'qt6-svg' 'qt6-tools')

# Temporarily, the "olive-git" package is incompatible
# with the dependency "olive-community-effects-git".
# More information on the link:
# https://github.com/cgvirus/Olive-Editor-Community-Effects/blob/65b96e093c128f2bb9336e6b7ed93f801e73435d/README.md
# optdepends=('olive-community-effects-git')

provides=('olive')
conflicts=('olive')
source=('git+https://github.com/olive-editor/olive.git')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  # Fix link problem with Imath library
  echo "target_link_libraries(Imath::Imath INTERFACE OpenEXR::OpenEXR)" >> $_pkgname/cmake/FindOpenEXR.cmake
}

build() {
  cd $_pkgname
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=6 \
        -DOTIO_DEPS_INCLUDE_DIR=/usr/include/opentimelineio \
        -DCMAKE_PREFIX_PATH="/usr/lib/ffmpeg4.4;/usr/include/ffmpeg4.4"
  ninja -C build/
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" ninja -C build/ install
}

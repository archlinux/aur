# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=olive
pkgname=$_pkgname-git
pkgver=continuous.r1621.g41a49c488
pkgrel=1
arch=('pentium4' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'openimageio' 'opentimelineio' 'portaudio' 'qt5-base')
makedepends=('cmake' 'git' 'ninja' 'qt5-svg' 'qt5-tools')

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

prepare() {
  cd $_pkgname

  # The OpenTimelineIO library requires some features of C++17 standard.
  # Olive uses C++14 by default, preventing the compilation of modules that use OpenTimelineIO.
  sed -i "/CXX_STANDARD/ s/14/17/" CMakeLists.txt
}

build() {
  cd $_pkgname
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOTIO_DEPS_INCLUDE_DIR=/usr/include/opentimelineio
  ninja -C build/
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" ninja -C build/ install
}

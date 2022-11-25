# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=olive
pkgname=$_pkgname-git
pkgver=continuous.r2461.g4c00387ab
pkgrel=1
arch=('x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
#depends=('ffmpeg' 'openimageio' 'opentimelineio' 'portaudio' 'qt6-base')
depends=('ffmpeg' 'openimageio' 'portaudio' 'qt6-base')
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

prepare() {
  # Currently, the build process fails if the OpenTimelineIO library is used
  sed -i '/find_package(OpenTimelineIO)/d' \
         "$srcdir"/$_package/CMakeLists.txt
}

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=6
  ninja -C build/
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" ninja -C build/ install
}

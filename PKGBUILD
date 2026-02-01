# Contributor: Nicolas Lorin <androw95220@gmail.com>

_pkgname='Barony'
pkgname='barony'
pkgver=4.3.2_hf1
pkgrel=1
pkgdesc="Barony is the premier first-person roguelike with cooperative play"
url="https://github.com/TurningWheel/Barony"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
depends=('libpng' 'mesa' 'glu' 'sdl2_image' 'sdl2_net' 'sdl2_ttf' 'physfs' 'rapidjson')
makedepends=('cmake' 'openal')
optdepends=(
  'openal: for audio support'
)
source=("${_pkgname}-${pkgver/_/-}.tar.gz::https://github.com/TurningWheel/Barony/archive/refs/tags/v${pkgver/_/-}.tar.gz"
        0001_fix-format-security.patch)
sha256sums=('4441b72d16573174febe1369c74fbaf4ebacbc29d47a360c5096c12aaea74033'
            'b8480b8898b5ebe4c9e703b3de7f72fe2fed00d90185e453433519e5870acf13')

prepare() {
  # Not correctly using snprintf in some places which causes a trigger of "-Werror=format-security"
  patch -Np1 -i 0001_fix-format-security.patch
}
build() {
  local cmake_options=(
    -B build
    -S ${_pkgname}-${pkgver/_/-}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D OPENAL_ENABLED=ON
    -D FMOD_ENABLED=OFF
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

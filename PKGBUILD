# Maintainer:
# Contributor: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname="scd"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=3
pkgdesc="Free and open source driver for the Steam Controller"
url="https://gitlab.com/dennis-hamester/scd"
license=('ISC')
arch=('i686' 'x86_64')

depends=(
  'boost-libs'
  'scraw' # AUR
)
makedepends=(
  'boost'
  'cmake'
  'ninja'
  'scrawpp' # AUR
)

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/-/archive/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('1895d4574dc7c789033f77da43622cf493ad4a6e288e89c3fe5ee84c13f0ecf2')

prepare() {
  cd "$_pkgsrc"
  local _files=(
    scd/linux/keyboard.hpp
    scd/linux/mouse.hpp
    scd/linux/xbox360_controller.hpp
  )
  sed -e '1i #include <cstdint>' -i "${_files[@]}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

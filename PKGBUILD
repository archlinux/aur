# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: xiota

_pkgname="skyemu"
pkgname="libretro-$_pkgname-git"
pkgver=4.r8.g246ba26
pkgrel=2
pkgdesc="SkyEmu is a multi-system emulator, supporting Game Boy, Game Boy Color and Nintendo DS"
url="https://github.com/skylersaleh/SkyEmu"
license=('MIT')
arch=('x86_64')

depends=(
  'gcc-libs'
  'glibc'
  'libgl'
  'libretro-core-info'
)
makedepends=(
  'cmake>=3.15'
  'git'
  'ninja'
#  'libx11'
#  'libxcursor'
#  'libxi'
)

provides=("libretro-$_pkgname")
conflicts=("libretro-$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/skylersaleh/SkyEmu.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DRETRO_CORE_ONLY=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build --target skyemu_libretro --config Release
}

package() {
  install -Dm755 build/skyemu_libretro.so "$pkgdir/usr/lib/libretro/skyemu_libretro.so"
}


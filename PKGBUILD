# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexey D. <lq07829icatm at rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname='ark-git'
_basename="${pkgname%-git}"
pkgver=22.04.1.r57.g6037bcd0
pkgrel=1
pkgdesc='Compressed archive manager from KDE Gear'
arch=('i686' 'x86_64')
url="https://apps.kde.org/${_basename}/"
license=('GPL')
groups=('kde-applications' 'kde-utilities')
depends=(
  'hicolor-icon-theme'
  'kitemmodels-git'
  'kparts-git'
  'kpty-git'
  'libarchive-git'
  'libzip'
)
makedepends=(
  'extra-cmake-modules-git'
  'git'
  'kdoctools-git'
  'python'
)
optdepends=(
  'lrzip: LRZ format support'
  'lzop: LZO format support'
  'p7zip: 7Z format support'
  'unrar: RAR decompression support'
  'unarchiver: alternative support for RAR and multipart ZIP formats'
  'unzip: legacy extraction support for single-part ZIP files'
  'zip: legacy compression support for single-part ZIP files'
)
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
source=("git+https://invent.kde.org/utilities/${_basename}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_basename}"

  # Generate git tag based version. Count only proper v#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

prepare() {
  printf 'Configuring external build flags for CMake...\n'
  printf '# Adding CPPFLAGS to CFLAGS, CXXFLAGS; otherwise CMake might ignore the former.\n'

  export CFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS
  export CXXFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS

  printf '# Adding LDFLAGS to CMake LINKER_FLAGS_INIT vars, otherwise CMake might ignore the former.\n\n'

  printf 'Configuring CMake build...\n'
  cmake -B build -S "${_basename}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_TESTING='OFF'
}

build() {
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

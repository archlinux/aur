# Maintainer:
# Contributor: ahmetlii

_pkgname="organicmaps"
pkgname="$_pkgname-git"
pkgver=2025.05.20.r101.gd9ca79e
pkgrel=1
pkgdesc="An offline maps app for travelers, tourists, hikers, and cyclists, using crowd-sourced OpenStreetMap data"
url="https://github.com/organicmaps/organicmaps"
license=("Apache-2.0")
arch=("x86_64" "aarch64" "riscv64")

depends=(
  'freetype2'
  'hicolor-icon-theme'
  'icu'
  'libglvnd'
  'perl'
  'python'
  'qt6-base'
  'qt6-positioning'
  'qt6-svg'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'glm'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxml2'
  'libxrandr'
  'ninja'
  'vulkan-headers'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
#source=("$_pkgsrc"::"git+$url.git")
#sha256sums=('SKIP')

prepare() {
  # partial clone because repo is 8GB
  if [ ! -e "$_pkgsrc" ]; then
    git clone --filter=tree:0 "$url.git" "$_pkgsrc"
    cd "$_pkgsrc"
  else
    cd "$_pkgsrc"
    git reset --hard
    git clean -f -d -x
    git pull
  fi

  git rm -r '3party/CMake-MetalShaderSupport'
  git rm -r '3party/Vulkan-Headers'
  git rm -r '3party/boost'
  git rm -r '3party/freetype/freetype'
  git rm -r '3party/glm'
  git rm -r '3party/harfbuzz/harfbuzz'
  git rm -r '3party/icu/icu'

  git submodule update --init --recursive --depth 1

  sed -E \
    -e 's&PLATFORM_LINUX OR PLATFORM_ANDROID&FALSE&' \
    -e 's&FATAL_ERROR&WARNING&g' \
    -e '/add_compile_options/d' \
    -i CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  local _tag _version _revision _hash
  _tag=$(git tag -l '[0-9]*' | sort -rV | head -1)
  _version=$(sed -E 's&-.*$&&' <<< "${_tag:?}")
  _revision=$(git rev-list --count --cherry-pick "$_tag"..HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
}

build() {
  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_UNITY_BUILD=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --verbose --timeout 300 || :
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/lib
  rm -rf "$pkgdir"/usr/share/organicmaps/data/*test*
  rm -rf "$pkgdir"/usr/share/organicmaps/data/.Trash
}

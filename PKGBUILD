# Maintainer:

## links
# https://ares-emu.net/
# https://github.com/ares-emulator/ares

## options
: ${_build_avx:=true}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

_pkgname="ares-emu"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=143.r5.g54c898f
pkgrel=2
pkgdesc="Multi-system emulator focused on accuracy and preservation"
url="https://github.com/ares-emulator/ares"
license=("ISC")
arch=('x86_64')

depends=(
  'gtk3'
  'libao'
  'libgl'
  'libpulse'
  'librashader' # AUR
  'libretro-shaders'
  'libudev.so' # systemd-libs
  'openal'
  'sdl2'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'lld'
  'mesa'
  'ninja'
)

_source_stable() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=("SKIP")

  _prepare() (
    cd "$_pkgsrc"
    _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
    git checkout -f "$_tag"
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --tag | sed -E 's/^[^0-9]+//'
  }
}

_source_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=("SKIP")

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

if [ "${_build_git::1}" != "t" ]; then
  _source_stable
else
  _source_git
fi

prepare() {
  _run_if_exists _prepare

  # clear unwanted settings
  local _files=(
    "$_pkgsrc/cmake"/{macos,windows}/*.cmake
    "$_pkgsrc/cmake/linux/compilerconfig.cmake"
    "$_pkgsrc/cmake/common/versionconfig.cmake"
  )
  for i in "${_files[@]}"; do
    if [ -f "$i" ]; then
      rm -f "$i"
      touch "$i"
    fi
  done
}

build() (
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CC=clang
  CXX=clang++

  local _ldflags=(${LDFLAGS})
  LDFLAGS="${_ldflags[@]//*fuse-ld*/} -fuse-ld=lld"

  if [[ "${_build_avx::1}" == "t" ]]; then
    CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DARES_BUNDLE_SHADERS=OFF
    -DARES_SKIP_DEPS=ON
    -DARES_VERSION="$pkgver"
    -DARES_VERSION_CANONICAL="${pkgver%%.r*}"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  depends+=(
    'vulkan-driver'
    'vulkan-icd-loader'
  )

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}

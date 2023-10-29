# Maintainer:

_pkgname="replay-sorcery"
pkgname="$_pkgname"
pkgver=0.6.0
pkgrel=1
pkgdesc='Open-source, instant-replay solution for Linux'
url='https://github.com/matanui159/ReplaySorcery'
license=(GPL3)
arch=(x86_64 i686)

depends=(
  'ffmpeg'
  'gcc-libs'
  'libx11'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'libdrm: listing kms devices'
  'pulseaudio: recording audio'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
  echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

source+=(
  'libbacktrace'::'git+https://github.com/ianlancetaylor/libbacktrace.git'
  '0000-include-avutil-ch-layout.patch'
)
sha256sums+=(
  'SKIP'
  '5404e7d26db1eb8e051844d65c2182f9dfac813243d093ea8e4c4ae97bc548da'
)

prepare() {
  cd "$_pkgsrc"

  # submodules for replay-sorcery
  local -A _submodules=(
    ['libbacktrace']='dep/libbacktrace'
  )
   for key in ${!_submodules[@]} ; do
    git submodule init "${_submodules[${key}]}"
    git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
    git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
  done

  # apply patches
  local src
  for src in "${source[@]}"; do
  src="${src%%::*}"
  src="${src##*/}"
  src="${src%.zst}"
  if [[ $src == *.patch ]] ; then
    printf '\nApplying patch: %s\n' "$src"
    patch -Np1 -F100 -i "${srcdir:?}/$src"
  fi
  done
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_BUILD_TYPE=Release
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

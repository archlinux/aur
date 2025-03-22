# Maintainer:
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>

## links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

## options
: ${_static_libquotient:=false}

: ${_commit:=53be5b207c899e3393e5e3702d66fe315eb73a07}

_pkgname="quaternion"
pkgname="$_pkgname"
pkgver=0.0.97.1
pkgrel=1
pkgdesc='Qt-based IM client for the Matrix protocol'
url="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
arch=('aarch64' 'i686' 'x86_64')

depends=(
  libolm
  qt6-declarative
  qt6-multimedia
  qtkeychain-qt6
)
makedepends=(
  clang
  cmake
  git
  ninja
  qt6-tools
)

options=('!emptydirs')

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums=('SKIP')
}

_source_quaternion() {
  source+=("libquotient"::'git+https://github.com/quotient-im/libQuotient')
  sha256sums+=('SKIP')

  _prepare_quaternion() (
    cd "$_pkgsrc"
    local _submodules=(
      'libquotient'::'lib'
    )
    _submodule_update
  )
}

_source_main

if [[ "${_static_libquotient::1}" == "t" ]]; then
  _source_quaternion
else
  depends+=('libquotient')
  export LDFLAGS+=" -Wl,--copy-dt-needed-entries"
fi

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_quaternion
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_BUILD_TYPE=None
    -DUSE_INTREE_LIBQMC=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    hicolor-icon-theme
  )

  DESTDIR="$pkgdir" cmake --install build

  # conflicts with extra/libquotient
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib"
  rm -rf "$pkgdir/usr/share/ndk-modules"
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}

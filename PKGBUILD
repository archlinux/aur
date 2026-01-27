# Maintainer:
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>

: ${_static_libquotient:=false}

: ${_commit:=53be5b207c899e3393e5e3702d66fe315eb73a07}

_pkgname="quaternion"
pkgname="$_pkgname"
pkgver=0.0.97.1
pkgrel=2
pkgdesc='Qt-based IM client for the Matrix protocol'
url="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
arch=('aarch64' 'i686' 'x86_64')

depends=(
  'libolm'
  'qt6-declarative'
  'qt6-multimedia'
  'qtkeychain-qt6'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

if [ "${_static_libquotient::1}" != "t" ]; then
  depends+=('libquotient')
  export LDFLAGS+=" -Wl,--copy-dt-needed-entries"
fi

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  if [[ "${_static_libquotient::1}" == "t" ]]; then
    sed -E -e 's&\b(url) = \.\./\.\./&\1 = https://github.com/&' -i .gitmodules
    git submodule update --init --recursive --depth=1
  fi

  # fix for Qt 6.10
  sed -E -e 's&((\$\{Qt\}::)?\bWidgets\b)&\2CorePrivate \1&' -i CMakeLists.txt
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

  if [[ "${_static_libquotient::1}" == "t" ]]; then
    _cmake_options+=(-DBUILD_TESTING=OFF)
  fi

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

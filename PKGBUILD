# Maintainer: (unmellow)melton.mayfield-brown@outlook.com
# Contributor: needed by lokinet 0.9.14 (liboxenmq.so.0)
# Matching submodule: oxen-io/lokinet v0.9.14 → oxen-mq v1.2.18

pkgname=oxen-mq
pkgver=1.2.18
pkgrel=1
pkgdesc="ZeroMQ-based message passing library (liboxenmq.so.0)"
url="https://github.com/oxen-io/oxen-mq"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64')
depends=(
  'gcc-libs'
  'glibc'
  'libsodium'
  'zeromq'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'pkgconf'
)
provides=('liboxenmq.so')
conflicts=('oxen-mq-git')
_pkgsrc="${pkgname}"
source=(
  "$_pkgsrc"::"git+$url.git#tag=v$pkgver"
)
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  git submodule update --init --depth=1 oxen-encoding cppzmq

  # v1.2.18 cmake_minimum_required is 3.7; CMake 4.x needs a bump
  sed -i 's/cmake_minimum_required(VERSION 3\.[0-9]\+)/cmake_minimum_required(VERSION 3.10)/' \
    CMakeLists.txt
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_WARN_DEPRECATED=OFF
    -Wno-author
    -Wno-deprecated
    -DBUILD_SHARED_LIBS=ON
    -DOXENC_INSTALL=ON
    -DOXENMQ_BUILD_TESTS=OFF
    -DOXENMQ_INSTALL=ON
    -DOXENMQ_INSTALL_CPPZMQ=OFF
    -DWARNINGS_AS_ERRORS=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_pkgsrc/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # sanity: this is the file lokinet dlopens / links
  if [[ ! -e "$pkgdir/usr/lib/liboxenmq.so.0" ]]; then
    echo "error: liboxenmq.so.0 was not installed" >&2
    find "$pkgdir/usr/lib" -maxdepth 1 -type f -o -type l | sort >&2 || true
    return 1
  fi
}

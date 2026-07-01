# Maintainer: Julian Mundhahs <julian plus packaging at mundhahs dot dev>
_pkgname=qlever
pkgname="${_pkgname}-git"
pkgver=r2427.618fcede1
pkgrel=1
epoch=0
pkgdesc="SPARQL engine"
arch=(any)
url=https://github.com/ad-freiburg/qlever
license=(Apache-2.0)
makedepends=(cmake
             git
             ninja
             gcc
             boost)
depends=(zstd
         openssl
         glibc
         libstdc++
         bzip2
         zlib
         libgcc
         boost-libs
         jemalloc
         icu)
conflicts=("$_pkgname")
provides=("$_pkgname=${pkgver}")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
   cd "${srcdir}/${_pkgname}"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   local cmake_options=(
      -B build
      -S ${_pkgname}
      -W no-dev
      -D CMAKE_BUILD_TYPE=None
      -D CMAKE_CXX_FLAGS="$CXXFLAGS -fmacro-prefix-map=$(pwd)/="
      -GNinja
   )
   cmake "${cmake_options[@]}"
   cmake --build build --target qlever-server qlever-index
}

package() {
   install -Dm0755 build/qlever-server "$pkgdir/usr/bin/qlever-server"
   install -Dm0755 build/qlever-index "$pkgdir/usr/bin/qlever-index"
}


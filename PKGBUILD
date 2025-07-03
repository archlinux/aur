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
         gcc-libs
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
   cd "${srcdir}/${_pkgname}"
   cmake -DCMAKE_BUILD_TYPE=Release -S . -B ./build -GNinja
   cmake --build ./build --config Release --target ServerMain IndexBuilderMain
}

package() {
   cd "${srcdir}/${_pkgname}"
   install -Dm0755 ./build/ServerMain "$pkgdir/usr/bin/qlever-server"
   install -Dm0755 ./build/IndexBuilderMain "$pkgdir/usr/bin/qlever-index"
}


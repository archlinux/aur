# Maintainer: Daniel Salwasser <daniel.salwasser AT outlook DOT com>

pkgname=kaminpar
pkgver=3.4.1.r0.gdf92c6a
pkgrel=1
pkgdesc="Parallel heuristic solver for the balanced k-way graph partitioning problem"
arch=(aarch64 x86_64)
url="https://github.com/KaHIP/KaMinPar"
license=(MIT)
depends=(numactl onetbb openmpi sparsehash)
makedepends=(cmake)
source=(
  "git+https://github.com/KaHIP/KaMinPar.git#commit=df92c6a62cbb22e44512d2f5640e4b1f2c97a65c"
  "git+https://github.com/kamping-site/kassert.git#commit=988b7d54b79ae6634f2fcc53a0314fb1cf2c6a23"
  "git+https://github.com/KarlsruheGraphGeneration/KaGen.git#commit=70386f48e513051656f020360c482ce6bff9a24f"
  "git+https://github.com/google/googletest.git#commit=5a37b517ad4ab6738556f0284c256cae1466c5b4"
  "git+https://github.com/Forceflow/libmorton.git#commit=6d22725504388864751603424060ab1eef1ab8a4"
  "git+https://github.com/Cyan4973/xxHash.git#commit=6f9771f2c014a703f151ac646d5f8074b6236c84"
)
sha256sums=('ea8b542628e343facbcc21e063e395f4f3c1a0cbaabb1b89788ed32936113d0b'
            '2216d58c7210159575bd35f0e73005412d9622be54d89f5d6f0e9ef036ab88fd'
            'aa3768f2b384a208ed1e09a36d6aa89bb202284ee2a61f4a70cd5e7af09f582b'
            '31888b0bc83e8e1e04f62e332829eb88099872b9ce4db0f6d0ee1634ff3f167c'
            'f8d86e9f515df9d6abdedcdb6ac9f65282cf79f6577f5353e018f64f43d0ebc2'
            '72d0e0674be272fc0a6c1cc248d88bfaa0ac570befdb27d5fad54a417bea9093')

pkgver() {
  cd KaMinPar
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/KaGen
  git submodule init
  git config submodule.extlib/libmorton.url "$srcdir/libmorton"
  git config submodule.extlib/xxHash.url "$srcdir/xxHash"
  git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -DBUILD_SHARED_LIBS=On
    -DCMAKE_POSITION_INDEPENDENT_CODE=On
    -DKAMINPAR_BUILD_DISTRIBUTED=On
    -DKAMINPAR_BUILD_WITH_MTUNE_NATIVE=Off
    -DFETCHCONTENT_FULLY_DISCONNECTED=On
    -DFETCHCONTENT_SOURCE_DIR_KASSERT=$srcdir/kassert
    -DFETCHCONTENT_SOURCE_DIR_KAGEN=$srcdir/KaGen
    -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST=$srcdir/googletest
  )

  cmake -B build -S "KaMinPar" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${cmake_options[@]}"

  cmake --build build --parallel $(nproc)
}

check() {
  ctest --test-dir build --output-on-failure --parallel $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

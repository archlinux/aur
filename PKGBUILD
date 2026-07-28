# Maintainer: Colin Reeder <colin@vpzom.click>
# Contributor: Aleksandar Trifunović <akstrfn@gmail.com>

_pkgname=valhalla
pkgname=$_pkgname
pkgver=3.8.3
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64' 'aarch64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost-libs' 'protobuf' 'abseil-cpp' 'python' 'python-numpy' 'libspatialite' 'spatialite-tools' 'luajit' 'chrono-date' 'gdal' 'lz4' 'libgeotiff')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost' 'cxxopts' 'libosmium' 'protozero' 'rapidjson')
source=("$_pkgname-$pkgver::git+${url}#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname-$pkgver"
  git submodule update --init --recursive

  # -mno-sse4.2 is APPENDED to user CFLAGS to subtract SSE4.2 codegen.
  # Why: any -march= that enables SSE4.2 (i.e. -march=native on any CPU >= Nehalem,
  # or any -march=x86-64-v2 or higher) makes valhalla's libvalhalla.so.3 emit
  # 'pcmpgtq' instructions inside std::_Hashtable::_M_insert_unique_node and
  # osmium::io::Reader<>. This SSE4.2 codegen path causes the .eh_frame
  # exception-unwind tables for valhalla::sif::CostFactory::CreateModeCosting to
  # become inconsistent. On a thrown exception inside that function (any /route
  # request with costing=auto|truck|taxi), the unwinder lands at a trap-filler
  # address `mov 0x28, %eax; ud2` between two endbr64 landing pads, dereferencing
  # null+0x28 → SIGSEGV. Bug confirmed in valhalla 3.6.3 through master (still
  # present in 3.8.3). Upstream docker uses no -march so it never triggers.
  # Tracked upstream: https://github.com/valhalla/valhalla/issues/6079 (OPEN).
  # Full investigation: build/debug/INVESTIGATION.md in valhalla-pi repo.
  #
  # Trade-off: -mno-sse4.2 removes SSE4.2 AND everything above it in gcc's flag
  # hierarchy (AVX, AVX2, FMA, AVX-512). Routing is memory-bound; perf impact
  # is small. Remove this flag if/when upstream fixes the underlying UB (#6079).
  #
  # 3.8.3 fixed the PREFER_EXTERNAL_DEPS GeoTIFF wiring (TIFF::tiff → TIFF::TIFF
  # alias for libtiff >= 4.7), so ENABLE_GEOTIFF can stay ON (default).

  cmake -S. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} -mno-sse4.2" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -mno-sse4.2" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPREFER_EXTERNAL_DEPS=ON \
    -DENABLE_DATA_TOOLS=On \
    -DENABLE_PYTHON_BINDINGS=On \
    -DENABLE_SERVICES=On \
    -DENABLE_CCACHE=Off \
    -DENABLE_HTTP=On \
    -DENABLE_SINGLE_FILES_WERROR=Off \
    -DENABLE_WERROR=Off \
    -DBUILD_SHARED_LIBS=On \
    -DENABLE_TESTS=OFF

}

build() {
  cd "$_pkgname-$pkgver/build"
  make
}

# no tests built but ctest does not fail
check() {
  cd "$_pkgname-$pkgver/build"
  ctest --parallel `nproc`
}

package() {
  cd "$_pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/share/doc/"{libvalhalla-dev,libvalhalla0,python-valhalla}

  install -Dm644 COPYING README.md CHANGELOG.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  cp -a docs/* "$pkgdir/usr/share/doc/$_pkgname/"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:

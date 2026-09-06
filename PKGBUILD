# Maintainer: Colin Reeder <colin@vpzom.click>
# Contributor: Aleksandar Trifunović <akstrfn@gmail.com>

_pkgname=valhalla
pkgname=$_pkgname
pkgver=3.8.3
pkgrel=2
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64' 'aarch64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost-libs' 'protobuf' 'abseil-cpp' 'python' 'python-numpy' 'libspatialite' 'spatialite-tools' 'luajit' 'chrono-date' 'gdal' 'lz4' 'libgeotiff')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost' 'cxxopts' 'libosmium' 'protozero' 'rapidjson')
source=("$_pkgname-$pkgver::git+${url}#tag=$pkgver"
        'no-python-stubgen.patch')
sha256sums=('SKIP'
            'b3fa1ceb574753e78c66bc07859cb2a4ab26007b5a5d7d60c64172690841086f')

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
  #
  # extra/nanobind 3.x installs /usr/lib/cmake/nanobind (symlink into
  # site-packages). Upstream's find_package(nanobind) loads that config,
  # which sets NB_DIR to the 3.x prefix, but then checks for a
  # nanobind::nanobind target (which the config does not define) and falls
  # back to add_subdirectory() of vendored nanobind 2.12. The 2.12 source
  # list is resolved under the leaked 3.x NB_DIR and cmake generate fails
  # on headers that no longer exist there. Disabling the probe is the
  # standard CMake knob for this; it steers the build down the vendored
  # path upstream already intends. nanobind is compiled statically into
  # the extension, so vendoring it has no runtime ABI cost. Building
  # against system nanobind 3.x is untested upstream (not reported as of
  # 2026-09).
  #
  # Upstream also regenerates the committed _valhalla.pyi at build time
  # by importing the just-built .so (nanobind_add_stub). That is a
  # dev-time step: it writes into the source tree and adds nothing to the
  # package, since the tag already ships the stub in sync. Drop the target
  # and install the tagged .pyi. Applied as a patch so a future upstream
  # move of that line fails loudly instead of silently re-enabling it.
  # Proper fix is an upstream ENABLE_PYTHON_STUBS option.
  patch -Np1 -i "$srcdir/no-python-stubgen.patch"

  # Pin the interpreter. CMake's FindPython walks PATH directory by
  # directory and takes the first python3.X it meets, so a uv/pyenv/conda
  # interpreter in ~/.local/bin wins over /usr/bin/python3. That builds the
  # bindings against the wrong Python and, worse, installs them into that
  # interpreter's site-packages instead of the system one. A distro package
  # must target the distro interpreter regardless of the builder's PATH.
  cmake -S. -Bbuild \
    -DPython_EXECUTABLE=/usr/bin/python3 \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} -mno-sse4.2" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -mno-sse4.2" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPREFER_EXTERNAL_DEPS=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_nanobind=TRUE \
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

# Maintainer: Colin Reeder <colin@vpzom.click>
# Contributor: Aleksandar Trifunović <akstrfn@gmail.com>

_pkgname=valhalla
pkgname=$_pkgname
pkgver=3.6.3
pkgrel=3
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64' 'aarch64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost-libs' 'protobuf' 'abseil-cpp' 'python' 'python-numpy' 'libspatialite' 'luajit' 'chrono-date' 'gdal')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost' 'cxxopts' 'libosmium' 'protozero' 'rapidjson')
source=("$_pkgname-$pkgver::git+${url}#tag=$pkgver"
        "fix-cxxopts-cstdint.patch"
        "fix-adminbuilder-empty-inner-rings.patch")
sha256sums=('SKIP'
            'acadf0436ebe1932cd742201b16ce2d26f3f0bc2a8cddd7ee18e14534b81c2ce'
            'SKIP')

prepare() {
  cd "$_pkgname-$pkgver"
  git submodule update --init --recursive

  # Fix missing cstdint include in cxxopts (conditional application)
  patch -Np1 --forward -i ../fix-cxxopts-cstdint.patch || true

  # Fix crash when admin polygon has no inner rings (empty vector .front() call)
  patch -Np1 --forward -i ../fix-adminbuilder-empty-inner-rings.patch || true

  cmake -S. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
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
    -DENABLE_TESTS=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_nanobind=TRUE

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

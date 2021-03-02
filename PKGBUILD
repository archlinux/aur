# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=valhalla
pkgver=3.1.0
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost-libs' 'protobuf' 'python' 'lua' 'libspatialite')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost')
source=("$pkgname-$pkgver::git+${url}#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DATA_TOOLS=On \
    -DENABLE_PYTHON_BINDINGS=On \
    -DENABLE_SERVICES=On \
    -DENABLE_CCACHE=Off \
    -DENABLE_HTTP=On \
    -DBUILD_SHARED_LIBS=On \
    -DENABLE_BENCHMARKS=OFF \
    -DENABLE_TESTS=OFF

  cmake --build build -- "${MAKEFLAGS}"
}

# no tests built but ctest does not fail
check() {
  cd "$pkgname-$pkgver/build"
  ctest --parallel `nproc`
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build build -- DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/share/doc/"{libvalhalla-dev,libvalhalla0,python-valhalla}

  install -Dm644 COPYING README.md CHANGELOG.md -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:

# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=valhalla
pkgver=3.0.1
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost-libs' 'protobuf' 'python' 'lua' 'libspatialite')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost' 'rapidjson')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('7063e97ccae415a3bb56f5b40923f1f626f41d2dc805e5f5aa24fb5ff6d20f8e')

prepare() {
  cd "$pkgname-$pkgver"
  git clone https://github.com/scrosby/OSM-binary third_party/OSM-binary
  git clone https://github.com/valhalla/osmlr-tile-spec third_party/OSMLR
  git clone https://github.com/tronkko/dirent third_party/dirent
  git clone https://github.com/HowardHinnant/date third_party/date

  cd "$srcdir/$pkgname-$pkgver"/third_party/OSM-binary && git checkout 4e32fa2 -q
  cd "$srcdir/$pkgname-$pkgver"/third_party/OSMLR && git checkout 0f4000e -q
  cd "$srcdir/$pkgname-$pkgver"/third_party/dirent && git checkout 287ba92 -q
  cd "$srcdir/$pkgname-$pkgver"/third_party/date && git checkout 3e82a52 -q

  cd "$srcdir/$pkgname-$pkgver"

  # TODO this seems fixed but tests are failing upstream anyway
  # There is probably a better way to solve this. Sources:
  # https://groups.google.com/forum/#!topic/spatialite-users/YXnofHixXsM
  # https://github.com/valhalla/valhalla/issues/354
  sed -i 's/mod_spatialite/\/usr\/lib\/mod_spatialite/' src/mjolnir/admin.cc

  # https://github.com/valhalla/valhalla/issues/1570
  sed -i 's/GeometryFactory::unique_ptr gf = GeometryFactory::create();/GeometryFactory::Ptr gf = GeometryFactory::create();/' src/mjolnir/valhalla_build_admins.cc
}

build() {
  cd "$pkgname-$pkgver"
  cmake -H. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DATA_TOOLS=On \
    -DENABLE_PYTHON_BINDINGS=On \
    -DENABLE_NODE_BINDINGS=Off \
    -DENABLE_SERVICES=On \
    -DENABLE_CCACHE=Off \
    -DENABLE_HTTP=On \
    -DBUILD_SHARED_LIBS=On

  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  cmake --build build -- check
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build build -- DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/share/doc/"{libvalhalla-dev,libvalhalla0,python-valhalla}
  rm "$pkgdir/usr/share/doc/$pkgname/ChangeLog"

  install -Dm644 COPYING README.md CHANGELOG.md -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:

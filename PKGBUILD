# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=valhalla
pkgver=2.6.2
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost-libs' 'protobuf' 'python' 'lua' 'libspatialite')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost' 'rapidjson')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('d6efbda5d66ea20dddf070dc70e9b4891270df2d3fa06d801f0f800aab011126')

prepare() {
  cd "$pkgname-$pkgver"
  git clone --depth=1 https://github.com/scrosby/OSM-binary third_party/OSM-binary
  git clone --depth=1 https://github.com/valhalla/osmlr-tile-spec third_party/OSMLR

  # TODO this seems fixed but tests are failing upstream anyway
  # There is probably a better way to solve this. Sources:
  # https://groups.google.com/forum/#!topic/spatialite-users/YXnofHixXsM
  # https://github.com/valhalla/valhalla/issues/354
  sed -i 's/mod_spatialite/\/usr\/lib\/mod_spatialite/' src/mjolnir/admin.cc
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
    -DENABLE_SERVICES=On \
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

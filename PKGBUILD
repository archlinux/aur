# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=valhalla
pkgver=2.6.1
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost' 'protobuf' 'python' 'lua' 'libspatialite' 'rapidjson')
makedepends=('cmake' 'git' 'vim' 'jq')
source=("https://github.com/valhalla/valhalla/archive/$pkgver.tar.gz")
sha256sums=('30321f370e825be94ba49e21fef6d49bbe2267d16d9c78b228d263aa0d830d1c')

prepare() {
  cd "$pkgname-$pkgver"
  git clone --depth=1 https://github.com/scrosby/OSM-binary third_party/OSM-binary
  git clone --depth=1 https://github.com/valhalla/osmlr-tile-spec third_party/OSMLR
  # There is probably a better way to solve this. Sources:
  # https://groups.google.com/forum/#!topic/spatialite-users/YXnofHixXsM
  # https://github.com/valhalla/valhalla/issues/354
  sed -i 's/mod_spatialite/\/usr\/lib\/mod_spatialite/' src/mjolnir/admin.cc

  # Make locales necessary for testing
  cd locales
  ./make_locales.sh
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
  rm -rf "$pkgdir/usr/share/doc/$pkgname/ChangeLog"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:

# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=valhalla
pkgver=2.4.8
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost' 'protobuf' 'python' 'lua' 'libspatialite' 'rapidjson')
makedepends=('git' 'vim' 'jq')
source=("https://github.com/valhalla/valhalla/archive/$pkgver.tar.gz")
sha256sums=('631a3c790e073c0cf2a5a710520b971e9ab7ef130857fe5fa47dd5e75e338b59')


prepare() {
  cd "$pkgname-$pkgver"
  git clone --depth=1 https://github.com/scrosby/OSM-binary
  git clone --depth=1 https://github.com/valhalla/osmlr-tile-spec OSMLR
  # There is probably a better way to solve this. Sources:
  # https://groups.google.com/forum/#!topic/spatialite-users/YXnofHixXsM
  # https://github.com/valhalla/valhalla/issues/354
  sed -i 's/mod_spatialite/\/usr\/lib\/mod_spatialite/' src/mjolnir/admin.cc
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:

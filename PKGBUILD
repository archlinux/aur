# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=valhalla
pkgver=2.4.9
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64')
url="https://github.com/valhalla/valhalla"
license=('custom:MIT')
depends=('prime_server' 'boost' 'protobuf' 'python' 'lua' 'libspatialite' 'rapidjson')
makedepends=('git' 'vim' 'jq')
source=("https://github.com/valhalla/valhalla/archive/$pkgver.tar.gz")
sha256sums=('a28080494003753ca040b98d2fafcaee58d7a37e8f3e7b982f98703be728f728')

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

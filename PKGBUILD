# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=2.4.0
pkgrel=3
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua>=5.1' 'protobuf' 'sqlite' 'shapelib' 'rapidjson')
makedepends=('boost' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz"
        "cpp17.patch::https://github.com/systemed/tilemaker/commit/eadbff9a9d9497e67e6a3ead73d2e90d952c60c1.patch")
sha512sums=('3dbcee04db82d9e16779a39f2ee5bcbcd78c39eb3d5873590ca98158c252d85beb2651680ccc59c7367cf24b11f11e967d7f52702752804fce8dde8eaeaa6f4e'
            '9c344138d847aaead0ccaccd45180ce063704577ce13cccaf3c6e9ee73a8bcc9420e480578e4a846160793066f8f73bcb8a1050703d92d710f4b3779e0b3a222')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/cpp17.patch"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  install -Dm 0755 build/tilemaker $pkgdir/usr/bin/tilemaker
  install -Dm 0644 "$pkgname-$pkgver"/LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=3.0.0
pkgrel=2
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua>=5.1' 'protobuf' 'sqlite' 'shapelib' 'rapidjson')
makedepends=('boost' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz"
"boost.patch::https://github.com/systemed/tilemaker/commit/6509f0cf50943a90b36b5c6802118b72124b1e7a.patch"
  )
sha512sums=('33c568d0107bf0cd9510f860d221fb4980bcf9ba07de2063c8842f0436aad612f1c17464d4bbe00547605d0066a00ec8ec00e1832169c05f48135f7f51898bed'
            '524069a2615a9819b33cf2b36fe1b4bd525fbc50d0105b6f4e73c89025ea3622b8c641dda626f9a1e6e218f9b24657d1d796a903d17b187cff26a54e22494ceb')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir"/boost.patch
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

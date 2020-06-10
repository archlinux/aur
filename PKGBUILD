# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=pathfinder-git
pkgver=0.1.0.1494.g0f350092
pkgrel=1
pkgdesc="A fast, practical GPU rasterizer for fonts and vector graphics"
arch=('x86_64')
url="https://github.com/servo/pathfinder"
license=('MIT' 'Apache')
depends=('harfbuzz' 'fontconfig')
makedepends=('git' 'rust' 'cargo-c')
provides=('pathfinder')
conflicts=('pathfinder')
source=("git+https://github.com/servo/pathfinder"
        'https://github.com/servo/pathfinder/pull/343.patch')
sha256sums=('SKIP'
            'e7bd0e8dc5fccf0ede19622714213db6b633bdf283903d00833089408ab97ab8')

pkgver() {
  cd "pathfinder"

  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "0.1.0.%s.g%s" "$_rev" "$_hash"
}

prepare() {
  cd pathfinder
  patch -p1 < ../343.patch
}

package() {
  cd pathfinder/c

  cargo cinstall \
    --release \
    --destdir "$pkgdir" \
    --prefix /usr

  cd ..
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/pathfinder
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir"/usr/share/licenses/pathfinder
}

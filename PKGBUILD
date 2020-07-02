# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=pathfinder-git
pkgver=0.1.0.1560.g90eeebca
pkgrel=1
pkgdesc="A fast, practical GPU rasterizer for fonts and vector graphics"
arch=('x86_64')
url="https://github.com/servo/pathfinder"
license=('MIT' 'Apache')
depends=('harfbuzz' 'fontconfig')
makedepends=('git' 'rust' 'cargo-c')
provides=('pathfinder')
conflicts=('pathfinder')
source=("git+https://github.com/servo/pathfinder")
sha256sums=('SKIP')

pkgver() {
  cd "pathfinder"

  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "0.1.0.%s.g%s" "$_rev" "$_hash"
}

prepare() {
  cd pathfinder
  sed -i 's/GL_GOOGLE_include_directive/GL_ARB_shading_language_include/g' resources/shaders/*/*.glsl
  sed -i 's/^name = .*/name = "pathfinder"/' c/Cargo.toml
}

build() {
  cd pathfinder
  cargo update
}

package() {
  cd pathfinder/c

  cargo cinstall \
    --release \
    --destdir "$pkgdir" \
    --prefix /usr

  install -dm755 "$pkgdir"/usr/share/pathfinder

  cd ..
  cp -a resources "$pkgdir"/usr/share/pathfinder
  rm -f "$pkgdir"/usr/share/pathfinder/resources/Cargo.toml
  rm -f "$pkgdir"/usr/share/pathfinder/resources/build.rs
  rm -f "$pkgdir"/usr/share/pathfinder/resources/MANIFEST
  rm -rf "$pkgdir"/usr/share/pathfinder/resources/src

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/pathfinder
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir"/usr/share/licenses/pathfinder
}

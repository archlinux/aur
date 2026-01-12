# Maintainer: BinaryHarbinger <halilefeesen@proton.me>

pkgname=riftbar-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Highly customizable GTK4 bar for Wayland written in Rust (git version)"
arch=('x86_64')
url="https://github.com/binaryharbinger/riftbar"
license=('GPL-3.0-only')

depends=(
  'gtk4'
  'gtk4-layer-shell'
  'wayland'
  'vulkan-icd-loader'
)

makedepends=('git' 'cargo' 'pkg-config')

provides=('riftbar')
conflicts=('riftbar')

source=("git+https://github.com/binaryharbinger/riftbar.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/riftbar"

  local tag
  tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0.0")

  printf "%s.r%s.g%s" \
    "${tag#v}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/riftbar"
  cargo build --release
}

package() {
  cd "$srcdir/riftbar"

  install -Dm755 target/release/riftbar "$pkgdir/usr/bin/riftbar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

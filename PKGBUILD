# Maintainer: BinaryHarbinger <halilefeesen@proton.me>

pkgname=riftbar-stable-git
pkgver=8fc89d4
pkgrel=1
pkgdesc="Async status bar for wayland written in rust (stable git version)"
arch=('x86_64')
url="https://github.com/binaryharbinger/riftbar"
license=('GPL-3.0-only')

depends=(
  'gtk4'
  'gtk4-layer-shell'
  'wayland'
)

depends+=('vulkan-icd-loader')

makedepends=('git' 'cargo' 'pkg-config')

provides=('riftbar')
conflicts=('riftbar')

source=("git+https://github.com/binaryharbinger/riftbar.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/riftbar"

  if git describe --long --tags --dirty --always &>/dev/null; then
    git describe --long --tags --dirty --always | sed 's/^v//'
  else
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/riftbar"
  cargo build --release
}

package() {
  cd "$srcdir/riftbar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 target/release/riftbar "$pkgdir/usr/bin/riftbar"
}


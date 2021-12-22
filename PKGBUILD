# Maintainer: Sigmasd
pkgname=bustd-git
pkgver=r81.caab293
pkgrel=1
pkgdesc="Process killer daemon for out-of-memory scenarios"
url="https://github.com/vrmiguel/bustd"
arch=('any')
license=('MIT')
makedepends=('cargo')
provides=(bustd)
conflicts=(bustd)
source=('git+https://github.com/vrmiguel/bustd.git' bustd.service)
sha256sums=('SKIP' '9478439a970d865cf29523f297fa3c2a6ce9aa4fd04b1c2ab1ccbde9a320333f')

prepare() {
  cd "$srcdir/bustd"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "$srcdir/bustd"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/bustd"
  cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "bustd/target/release/bustd"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/bustd" "bustd/LICENSE"
    install -Dm0644 -t "$pkgdir/usr/share/doc/bustd" "bustd/README.md"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" bustd.service
    echo "To enable and start bustd run 'sudo systemctl enable --now bustd.service'."
}

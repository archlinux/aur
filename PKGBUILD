# Maintainer: Sigmasd
pkgname=bustd-git
pkgver=r81.caab293
pkgrel=2
pkgdesc="Process killer daemon for out-of-memory scenarios"
url="https://github.com/vrmiguel/bustd"
arch=('any')
license=('MIT')
makedepends=('cargo')
provides=(bustd)
conflicts=(bustd)
source=('git+https://github.com/vrmiguel/bustd.git' bustd.service)
sha256sums=('SKIP' 'df0a067a5bd09dbd46753e0df3d5db227d083712a3a88cfe34a3a2a986c38553')

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

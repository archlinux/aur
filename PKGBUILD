# Maintainer: Grassblock <i at gb0 dot dev>
pkgname=scx-ppd-autopilot
pkgver=0.2.0
pkgrel=1
pkgdesc="A daemon that listens for power-profiles-daemon profile changes and switches scx schedulers/modes accordingly."
arch=('x86_64')
url="https://codeberg.org/grassblock/scx_ppd_autopilot"
license=('AGPL-3.0-or-later')
depends=('scx-scheds' 'power-profiles-daemon' 'systemd')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/grassblock/scx_ppd_autopilot/archive/${pkgver}.tar.gz")
sha256sums=('7276be9cfce403135f9ea96ac2524af1df28f60040aeff8554a1311ab8c460ba') # Update this with actual sha256sum after uploading release tarball

build() {
  cd "scx_ppd_autopilot"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "scx_ppd_autopilot"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "scx_ppd_autopilot"

  # Install binary
  install -Dm755 "target/release/scx_ppd_autopilot" -t "$pkgdir/usr/bin/"

  # Install default configuration
  install -Dm644 "config.example.toml" "$pkgdir/usr/share/scx_ppd_autopilot/config.toml"

  # Install systemd service
  install -Dm644 "etc/systemd/scx_ppd_autopilot.service" -t "$pkgdir/usr/lib/systemd/system/"

  # Install README
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname}/"
}

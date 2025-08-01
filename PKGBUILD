# Maintainer: alphaslayer
pkgname=portmux
pkgver=0.1.0
pkgrel=1
pkgdesc="A network port multiplexer daemon that routes connections based on protocol detection"
arch=('x86_64')
url="https://github.com/pes-innovation-lab/PortMux"
license=('MIT')
depends=('gcc-libs' 'python')
makedepends=('rust' 'cargo')
backup=('etc/portmux/config.yaml' 'etc/portmux/script.py')
install=portmux.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/pes-innovation-lab/PortMux/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "PortMux-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "PortMux-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked --target-dir=target
}

package() {
  cd "PortMux-$pkgver"

  install -Dm755 "target/release/portmux" "$pkgdir/usr/bin/portmux"

  sed 's|/usr/local/bin/portmux|/usr/bin/portmux|' portmux.service >portmux.service.tmp
  install -Dm644 portmux.service.tmp "$pkgdir/usr/lib/systemd/system/portmux.service"

  install -Dm644 config.yaml "$pkgdir/etc/portmux/config.yaml"
  install -Dm644 script.py "$pkgdir/etc/portmux/script.py"
}

# Maintainer: Wayazi <https://github.com/Wayazi>
pkgname=aperture-router
pkgver=0.3.3
pkgrel=1
pkgdesc="Universal AI router for Tailscale Aperture with dynamic model discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/Wayazi/aperture-router"
license=('MIT')
options=(!lto)
depends=('gcc-libs')
makedepends=('cargo' 'nasm')
install="$pkgname.install"
backup=('etc/sysconfig/aperture-router')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63cb6da7509436de3af8270aed8f45f83d3cefc74acd94226a3b57a0a815e066')

_prepare_dir() {
  cd "$srcdir/$pkgname-$pkgver"
}

prepare() {
  _prepare_dir
  unset CARGO_TARGET_DIR
  cargo fetch
}

build() {
  _prepare_dir
  unset CARGO_TARGET_DIR
  cargo build --release --features wizard
}

check() {
  _prepare_dir
  unset CARGO_TARGET_DIR
  cargo test --release --features wizard
}

package() {
  _prepare_dir

  # Binary
  install -Dm755 "target/release/aperture-router" "$pkgdir/usr/bin/aperture-router"

  # License and docs
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"

  # Systemd service
  install -Dm644 "contrib/systemd/aperture-router.service" "$pkgdir/usr/lib/systemd/system/aperture-router.service"
  install -Dm644 "contrib/systemd/aperture-router.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/aperture-router.conf"
  install -Dm644 "contrib/systemd/aperture-router.sysusers" "$pkgdir/usr/lib/sysusers.d/aperture-router.conf"

  # Sysconfig (environment file template)
  install -Dm644 "contrib/systemd/aperture-router.sysconfig" "$pkgdir/etc/sysconfig/aperture-router"
}

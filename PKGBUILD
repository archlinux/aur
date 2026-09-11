# Maintainer: Wayazi <https://github.com/Wayazi>
pkgname=aperture-router
pkgver=0.3.4
pkgrel=2
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
sha256sums=('eb61e322bd2c446a59a42c97b9f0897d24d0866df754db9eb99c0bd26e255cbb')

_prepare_dir() {
  cd "$srcdir/aperture-router-0.3.4"
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

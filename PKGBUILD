# Maintainer: Wayazi <https://github.com/Wayazi>
pkgname=aperture-router
pkgver=0.2.1
pkgrel=1
pkgdesc="Universal AI router for Tailscale Aperture with dynamic model discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/Wayazi/aperture-router"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install="$pkgname.install"
backup=('etc/sysconfig/aperture-router')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cb29daaeefc3a38615055d2354498b36050b6d51b8991c0580bbcdc6d08b94e3')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test
}

package() {
  cd "$pkgname-$pkgver"

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

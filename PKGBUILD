# Maintainer: Wayazi <https://github.com/Wayazi>
pkgname=aperture-router
pkgver=0.2.1
pkgrel=1
pkgdesc="Universal AI router for Tailscale Aperture with dynamic model discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/Wayazi/aperture-router"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'nasm')
install="$pkgname.install"
backup=('etc/sysconfig/aperture-router')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19c6220a43fd3c3f011486de1a9503843ba038b96d5e194c74f952691706cafe')

prepare() {
  cd "$pkgname-$pkgver"
  rm -rf target
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="${CFLAGS//-flto/}" CXXFLAGS="${CXXFLAGS//-flto/}" cargo build --release
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

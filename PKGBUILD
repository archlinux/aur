# Maintainer: Okazakee <okazakee@proton.me>
pkgname=tuxcharge-profile
pkgver=0.2.1
pkgrel=1
pkgdesc="Set a TUXEDO laptop charging profile based on the connected Wi-Fi network"
arch=('x86_64')
url="https://github.com/Okazakee/tuxcharge-profile"
license=('MIT')
depends=('networkmanager')
makedepends=('rust')
optdepends=('tuxedo-drivers-dkms: EC charging profile interface, required on TUXEDO hardware')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Okazakee/tuxcharge-profile/archive/v$pkgver.tar.gz")
sha256sums=('d78d0cc7c6408063d4cc0b4304a06fac037f0b43bed71db2c2193895e143d3a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # --locked uses the shipped Cargo.lock; not --frozen, so a clean chroot
  # (empty cargo cache) can still fetch its dependencies.
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/tuxcharge-profile "$pkgdir/usr/bin/tuxcharge-profile"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config/config.toml.example "$pkgdir/usr/share/$pkgname/config.toml.example"
  install -Dm644 systemd/tuxcharge-profile.service \
    "$pkgdir/usr/lib/systemd/system/tuxcharge-profile.service"
  install -Dm755 systemd/90-tuxcharge-profile \
    "$pkgdir/usr/lib/NetworkManager/dispatcher.d/90-tuxcharge-profile"
}

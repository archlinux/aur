pkgname=tapauth
pkgver=0.3.0-preview1
pkgrel=1
pkgdesc="Local smartphone-based authentication framework engine"
arch=('x86_64' 'aarch64')
url="https://github.com/lolle2000la/tapauth"
license=('Apache-2.0')
depends=('dbus' 'pam')
makedepends=('cargo' 'rust' 'protobuf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lolle2000la/tapauth/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b92c44200afc1ea9495570d25d73a4cfd46938a5a1e210a0011d32ff49b7c79c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_PROFILE_RELEASE_STRIP=true
  cargo build --frozen --workspace --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 target/release/tapauthd "$pkgdir/usr/bin/tapauthd"
  install -Dm0755 target/release/tapauth-config "$pkgdir/usr/bin/tapauth-config"
  install -Dm0755 target/release/libclient_pam.so "$pkgdir/usr/lib/security/pam_tapauth.so"
  install -Dm0644 systemd/tapauthd.service "$pkgdir/usr/lib/systemd/system/tapauthd.service"
  install -Dm0644 systemd/tapauthd.socket "$pkgdir/usr/lib/systemd/system/tapauthd.socket"
  install -Dm0644 packaging/sysusers.conf "$pkgdir/usr/lib/sysusers.d/tapauth.conf"
  install -Dm0644 packaging/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/tapauth.conf"
  install -Dm0644 client-config-gui/tapauth-config.desktop "$pkgdir/usr/share/applications/tapauth-config.desktop"
  install -Dm0644 client-config-gui/assets/tapauth-config.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tapauth-config.svg"
  install -Dm0644 tapauthd/dev.rourunisen.tapauth.config.admin.policy "$pkgdir/usr/share/polkit-1/actions/dev.rourunisen.tapauth.config.admin.policy"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=tapauth
pkgver=0.9.3
pkgrel=1
pkgdesc="Local smartphone-based authentication framework engine"
arch=('x86_64' 'aarch64')
url="https://github.com/lolle2000la/tapauth"
license=('AGPL-3.0')
depends=('dbus' 'pam')
makedepends=('cargo' 'rust' 'protobuf' 'clang')
backup=('etc/tapauth/config.toml')
install=tapauth.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/lolle2000la/tapauth/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4f9f84b99b025ade58ad8ce38471414d88edb3a44c655f8b8b8c4349a857a52')

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
  install -dm0755 "$pkgdir/etc/tapauth"
  install -Dm0755 target/release/tapauthd "$pkgdir/usr/bin/tapauthd"
  install -Dm0755 target/release/tapauth-config "$pkgdir/usr/bin/tapauth-config"
  install -Dm0755 target/release/libclient_pam.so "$pkgdir/usr/lib/security/pam_tapauth.so"
  install -Dm0644 systemd/tapauthd.service "$pkgdir/usr/lib/systemd/system/tapauthd.service"
  install -Dm0644 systemd/tapauthd.socket "$pkgdir/usr/lib/systemd/system/tapauthd.socket"
  install -Dm0644 systemd/polkit-agent-helper@.service.d/tapauth.conf "$pkgdir/usr/lib/systemd/system/polkit-agent-helper@.service.d/tapauth.conf"
  install -Dm0644 packaging/sysusers.conf "$pkgdir/usr/lib/sysusers.d/tapauth.conf"
  install -Dm0644 packaging/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/tapauth.conf"
  install -Dm0644 client-config-gui/tapauth-config.desktop "$pkgdir/usr/share/applications/tapauth-config.desktop"
  install -Dm0644 client-config-gui/assets/tapauth-config.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tapauth-config.svg"
  install -Dm0644 tapauthd/dev.rourunisen.tapauth.config.admin.policy "$pkgdir/usr/share/polkit-1/actions/dev.rourunisen.tapauth.config.admin.policy"
  install -Dm0644 packaging/50-tapauthd.rules "$pkgdir/usr/share/polkit-1/rules.d/50-tapauthd.rules"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

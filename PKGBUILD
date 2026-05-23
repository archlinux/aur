pkgname=tapauth
pkgver=0.1.16
pkgrel=1
pkgdesc="Local smartphone-based authentication framework engine"
arch=('x86_64' 'aarch64')
url="https://github.com/lolle2000la/tapauth"
license=('Apache-2.0')
depends=('dbus' 'pam')
makedepends=('cargo' 'rust' 'protobuf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lolle2000la/tapauth/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6cf943657e902ad52874c1b7c36ad3b8b624063b596378efecb73dcbba8400d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --workspace --release
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
  install -Dm0644 client-config-gui/dev.rourunisen.tapauth.policy "$pkgdir/usr/share/polkit-1/actions/dev.rourunisen.tapauth.policy"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

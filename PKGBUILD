# Maintainer: Leonardo Dagnino <leodag.sch@gmail.com>
pkgname=display-switch-tray
pkgver=1.0.0
pkgrel=1
pkgdesc="A tray icon for enabling and disabling display-switch's systemd service"
arch=('i686' 'x86_64')
url="https://github.com/leodag/display-switch-tray/"
license=('GPL')
depends=('libayatana-appindicator')
makedepends=('rust' 'cargo')
source=($pkgname::git+https://github.com/leodag/$pkgname.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "$pkgname"

  install -Dm755 "$srcdir/$pkgname/target/release/display_switch_tray" -t "$pkgdir/usr/bin/"
  install -dm750 "$pkgdir/etc/sudoers.d/"
  install -m644 "$srcdir/$pkgname/extra/60_display_switch" -t "$pkgdir/etc/sudoers.d/"
  install -Dm644 "$srcdir/$pkgname/extra/display-switch-tray.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$pkgname/extra/display-switch-tray-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$srcdir/$pkgname/extra/active-symbolic.svg" \
          "$srcdir/$pkgname/extra/inactive-symbolic.svg" \
          "$srcdir/$pkgname/extra/failed-symbolic.svg" \
          -t "$pkgdir/usr/share/display-switch-tray/icons/"
}

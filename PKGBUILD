pkgname=passkeyd-bin
_pkgname=passkeyd
pkgver=1.9.2
pkgrel=1
pkgdesc="Opinionated WebAuthn authenticator, without telemetry or interactive prompts"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('tpm2-tss' 'glibc' 'systemd-libs' 'libstdc++' 'pam')
optdepends=('gtk4: gtk frontend support'
            'glib2: gtk frontend support'
            'pango: gtk frontend support'
            'qt6-base: kde frontend support'
            'qt6-declarative: kde frontend support'
            'kirigami: kde frontend support'
            'hicolor-icon-theme: needed for hicolor theme hierarchy'
            'systemd: for running passkeyd as a service')
conflicts=("openrc" "runit" "passkeyd")
provides=("passkeyd")
makedepends=()
url="https://github.com/bjn7/passkeyd"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/bjn7/passkeyd/releases/download/v$pkgver/passkeyd-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('06cf8d6836294e1ba44777f2ce2b886508b305bd1b54cf32adb61df13f379ba1')
options=('!debug')
backup=('etc/passkeyd.conf' 'usr/share/passkeyd/theme.conf')

package() {
  cd "$srcdir"

  # Binary installation
  install -Dm755 passkeyd "$pkgdir/usr/bin/passkeyd"
  install -Dm755 passkeyd-manager "$pkgdir/usr/bin/passkeyd-manager"
  install -Dm755 passkeyd-migrate "$pkgdir/usr/bin/passkeyd-migrate"

# UI binary installation - ICE (Universal)
  install -Dm755 passkeyd-ice-enroll "$pkgdir/usr/lib/passkeyd/passkeyd-ice-enroll"
  install -Dm755 passkeyd-ice-select "$pkgdir/usr/lib/passkeyd/passkeyd-ice-select"
  install -Dm755 passkeyd-ice-selection "$pkgdir/usr/lib/passkeyd/passkeyd-ice-selection"

  # UI binary installation - KDE
  install -Dm755 passkeyd-kde-enroll "$pkgdir/usr/lib/passkeyd/passkeyd-kde-enroll"
  install -Dm755 passkeyd-kde-select "$pkgdir/usr/lib/passkeyd/passkeyd-kde-select"
  install -Dm755 passkeyd-kde-selection "$pkgdir/usr/lib/passkeyd/passkeyd-kde-selection"

  # UI binary installation - GTK
  install -Dm755 passkeyd-gtk-enroll "$pkgdir/usr/lib/passkeyd/passkeyd-gtk-enroll"
  install -Dm755 passkeyd-gtk-select "$pkgdir/usr/lib/passkeyd/passkeyd-gtk-select"
  install -Dm755 passkeyd-gtk-selection "$pkgdir/usr/lib/passkeyd/passkeyd-gtk-selection"

  # Database directory
  install -d -m 700 -o root -g root "$pkgdir/var/lib/passkeyd/database"

  # Configuration files
  install -Dm644 passkeyd.conf "$pkgdir/etc/passkeyd.conf"
  install -Dm644 theme.conf "$pkgdir/usr/share/passkeyd/theme.conf"

  # Systemd service
  install -Dm644 "$srcdir/passkeyd.service" "$pkgdir/usr/lib/systemd/system/passkeyd.service"

  # Icons
  install -Dm644 icons/32x32/passkeyd.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/passkeyd.png"
  install -Dm644 icons/64x64/passkeyd.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/passkeyd.png"
}

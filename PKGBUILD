# Maintainer: Frys (Frysuni)
pkgname=rsdm-bin
_pkgname=rsdm
pkgver=2.3.1
pkgrel=1
pkgdesc='Standalone Rust TTY/TUI Wayland display manager and screen locker (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/Frysuni/rsdm'
license=('GPL-3.0-only')
depends=('pam' 'systemd>=250' 'wayland' 'libxkbcommon' 'libsm' 'libice' 'gcc-libs')
provides=('rsdm')
conflicts=('rsdm')
backup=('etc/rsdm.toml'
        'etc/pam.d/rsdm'
        'etc/pam.d/rsdm-lock'
        'etc/logrotate.d/rsdm')
install='rsdm.install'
_base="https://github.com/Frysuni/rsdm/releases/download/v$pkgver"
source_x86_64=("$_base/rsdm-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_base/rsdm-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5333ee2d275a50d75852af5ef950202a0a0339061bff3dfddf5d2f45057e993e')
sha256sums_aarch64=('9963a1ca0187c6b48358d8a8d3c0876e684c2f5fc7c10c8459c4650cb259d941')

package() {
  cd "$srcdir"

  install -Dm755 rsdm "$pkgdir/usr/bin/rsdm"
  if [[ -f packaging/applications/org.rsdm.SessionManager.desktop ]]; then
    install -Dm644 packaging/applications/org.rsdm.SessionManager.desktop \
      "$pkgdir/usr/share/applications/org.rsdm.SessionManager.desktop"
  fi
  install -Dm644 packaging/systemd/rsdm.service \
    "$pkgdir/usr/lib/systemd/system/rsdm.service"
  install -Dm644 packaging/systemd/rsdm@.service \
    "$pkgdir/usr/lib/systemd/system/rsdm@.service"
  install -Dm644 packaging/systemd/rsdm-idle.service \
    "$pkgdir/usr/lib/systemd/user/rsdm-idle.service"
  install -Dm644 packaging/pam/rsdm "$pkgdir/etc/pam.d/rsdm"
  install -Dm644 packaging/pam/rsdm-lock "$pkgdir/etc/pam.d/rsdm-lock"
  install -Dm644 rsdm.toml "$pkgdir/etc/rsdm.toml"
  install -Dm644 packaging/logrotate/rsdm "$pkgdir/etc/logrotate.d/rsdm"
  install -dm700 "$pkgdir/var/cache/rsdm"
  install -dm750 "$pkgdir/var/log/rsdm"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  # SECURITY.md and ARCHITECTURE.md ship inside docs/ (the guide below).
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$_pkgname/guide"
  cp -r docs/. "$pkgdir/usr/share/doc/$_pkgname/guide/"
}

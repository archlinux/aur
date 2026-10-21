# Maintainer: Frys (Frysuni)
pkgname=rsdm-bin
_pkgname=rsdm
pkgver=2.4.1
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
sha256sums_x86_64=('38bb65b111045515427a7d8b2f5ea79f3ef4f23fd308f5a4648b865cf8bc2be2')
sha256sums_aarch64=('ac9d0663c769d197f6b4e66185f6bf02815a0978267f29ebfe7ca8dfc8c0fe2e')

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

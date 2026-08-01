# Maintainer: Frys (Frysuni)
pkgname=rsdm-bin
_pkgname=rsdm
pkgver=1.0.0
pkgrel=1
pkgdesc='Standalone Rust TTY/TUI Wayland display manager and screen locker (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/Frysuni/rsdm'
license=('GPL-3.0-only')
depends=('pam' 'systemd' 'wayland' 'libxkbcommon' 'gcc-libs')
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
# Replace SKIP with the published asset sha256 per arch (updatepkgsums).
sha256sums_x86_64=('4e25c8a03a3f15dda8b5439d5c40a8518b0ab766d02c3d3aec5c0932257c89ed')
sha256sums_aarch64=('6b35c46266af9b23f1cec5488238c83f5d2499daeb453598d0824a770b2bb864')

package() {
  cd "$srcdir"

  install -Dm755 rsdm "$pkgdir/usr/bin/rsdm"
  install -Dm644 packaging/systemd/rsdm.service \
    "$pkgdir/usr/lib/systemd/system/rsdm.service"
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

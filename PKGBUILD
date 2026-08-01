# Maintainer: Frys (Frysuni)
pkgname=rsdm
pkgver=1.0.0
pkgrel=1
pkgdesc='Standalone Rust TTY/TUI Wayland display manager and screen locker'
arch=('x86_64' 'aarch64')
url='https://github.com/Frysuni/rsdm'
license=('GPL-3.0-only')
depends=('pam' 'systemd' 'wayland' 'libxkbcommon' 'gcc-libs')
makedepends=('cargo' 'pkgconf')
provides=('rsdm')
conflicts=('rsdm-bin')
backup=('etc/rsdm.toml'
        'etc/pam.d/rsdm'
        'etc/pam.d/rsdm-lock'
        'etc/logrotate.d/rsdm')
install='rsdm.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Frysuni/rsdm/archive/refs/tags/v$pkgver.tar.gz")
# Replace SKIP with the release tarball's sha256 (updatepkgsums / sha256sum).
sha256sums=('48c1171be1342dea4a7922802e96864a9be2ea8c95d7fb702cd9c813f246a3b0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p rsdm
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --workspace
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/rsdm "$pkgdir/usr/bin/rsdm"
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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # SECURITY.md and ARCHITECTURE.md ship inside docs/ (the guide below).
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/guide"
  cp -r docs/. "$pkgdir/usr/share/doc/$pkgname/guide/"
}

# Maintainer: beac0n <gh@schempp.dev>

pkgname=ruroco-server
pkgver=0.14.1
pkgrel=2
pkgdesc='ruroco server + commander - validates UDP packets and runs configured commands'
arch=('x86_64')
url='https://github.com/beac0n/ruroco'
license=('MIT')
depends=('openssl' 'gcc-libs' 'glibc')
makedepends=('cargo')
backup=('etc/ruroco/config.toml')
install=ruroco-server.install
options=('!lto')
source=("ruroco-$pkgver.tar.gz::https://github.com/beac0n/ruroco/archive/refs/tags/v$pkgver.tar.gz"
        'ruroco.sysusers')
sha256sums=('3236dc6ccb73af6fc58b8f43f01a32594550a82dddf896554a0be41ce88acfa3'
            'e0899988bf07d43f878b813c47e510924f1705fa61fc88ff47913c7c5eae2f6f')

prepare() {
  cd "$srcdir/ruroco-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/ruroco-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # server + commander only - no GUI (eframe) is compiled. The release-build
  # feature is omitted so OpenSSL links dynamically against the system package
  # instead of being vendored.
  cargo build --release --frozen --no-default-features --features with-server --bin server --bin commander
}

package() {
  cd "$srcdir/ruroco-$pkgver"

  install -Dm755 target/release/server    "$pkgdir/usr/bin/ruroco-server"
  install -Dm755 target/release/commander "$pkgdir/usr/bin/ruroco-commander"

  # systemd units ship with /usr/local/bin paths; rewrite to packaged /usr/bin.
  install -Dm644 systemd/ruroco.service           "$pkgdir/usr/lib/systemd/system/ruroco.service"
  install -Dm644 systemd/ruroco-commander.service "$pkgdir/usr/lib/systemd/system/ruroco-commander.service"
  install -Dm644 systemd/ruroco.socket            "$pkgdir/usr/lib/systemd/system/ruroco.socket"
  sed -i 's|/usr/local/bin|/usr/bin|g' "$pkgdir"/usr/lib/systemd/system/*.service

  # creates the `ruroco` system user/group via systemd-sysusers (pacman hook)
  install -Dm644 "$srcdir/ruroco.sysusers" "$pkgdir/usr/lib/sysusers.d/ruroco.conf"

  # example config - marked as backup() so pacman preserves local edits
  install -Dm644 config/config.toml "$pkgdir/etc/ruroco/config.toml"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

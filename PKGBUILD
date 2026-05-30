# Maintainer: beac0n <gh@schempp.dev>

pkgbase=ruroco
pkgname=('ruroco-client' 'ruroco-client-ui' 'ruroco-server')
pkgver=0.14.1
pkgrel=1
pkgdesc='Run Remote Command — encrypted, one-way UDP remote command execution'
arch=('x86_64')
url='https://github.com/beac0n/ruroco'
license=('MIT')
# build() compiles all binaries in one pass, so every sub-package's link-time
# libs must be present at build time (split-package requirement).
makedepends=('cargo' 'openssl' 'gcc-libs' 'fontconfig' 'libglvnd'
             'libxkbcommon' 'wayland' 'libx11' 'libxi' 'libxcursor' 'libxrandr')
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/beac0n/ruroco/archive/refs/tags/v$pkgver.tar.gz"
        'ruroco.sysusers')
sha256sums=('3236dc6ccb73af6fc58b8f43f01a32594550a82dddf896554a0be41ce88acfa3'
            'e0899988bf07d43f878b813c47e510924f1705fa61fc88ff47913c7c5eae2f6f')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Build every binary in one pass. We deliberately omit the `release-build`
  # feature so OpenSSL is linked dynamically against the system package
  # instead of being vendored.
  cargo build --release --frozen \
    --no-default-features \
    --features with-client,with-gui,with-server
}

package_ruroco-client() {
  pkgdesc='ruroco client CLI — sends the encrypted UDP packets'
  depends=('openssl' 'gcc-libs' 'glibc')
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 target/release/client "$pkgdir/usr/bin/ruroco-client"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_ruroco-client-ui() {
  pkgdesc='ruroco client GUI (egui) — graphical front-end for ruroco-client'
  # NOTE: the X11/Wayland/GL libs below are loaded by eframe via dlopen at
  # runtime (x11-dl / wayland-sys / glow), so they do NOT appear in the ELF
  # NEEDED table. namcap reports them as "may not be needed" — that is a false
  # positive; removing them breaks the GUI at runtime. Keep them.
  depends=('openssl' 'gcc-libs' 'glibc' 'fontconfig' 'libglvnd'
           'libxkbcommon' 'wayland' 'libx11' 'libxi' 'libxcursor' 'libxrandr')
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 target/release/client_ui "$pkgdir/usr/bin/ruroco-client-ui"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

package_ruroco-server() {
  pkgdesc='ruroco server + commander — validates packets and runs configured commands'
  depends=('openssl' 'gcc-libs' 'glibc')
  backup=('etc/ruroco/config.toml')
  install=ruroco-server.install
  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 target/release/server    "$pkgdir/usr/bin/ruroco-server"
  install -Dm755 target/release/commander "$pkgdir/usr/bin/ruroco-commander"

  # systemd units ship with /usr/local/bin paths; rewrite to packaged /usr/bin.
  install -Dm644 systemd/ruroco.service           "$pkgdir/usr/lib/systemd/system/ruroco.service"
  install -Dm644 systemd/ruroco-commander.service "$pkgdir/usr/lib/systemd/system/ruroco-commander.service"
  install -Dm644 systemd/ruroco.socket            "$pkgdir/usr/lib/systemd/system/ruroco.socket"
  sed -i 's|/usr/local/bin|/usr/bin|g' "$pkgdir"/usr/lib/systemd/system/*.service

  # creates the `ruroco` system user/group via systemd-sysusers (pacman hook)
  install -Dm644 "$srcdir/ruroco.sysusers" "$pkgdir/usr/lib/sysusers.d/ruroco.conf"

  # example config — marked as backup() so pacman preserves local edits
  install -Dm644 config/config.toml "$pkgdir/etc/ruroco/config.toml"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Radim Vančo (FoxKyong) <radim.vanco@jifox.cz>

pkgname=liveside
pkgver=0.9.0
pkgrel=1
pkgdesc='Twitch chat client with a window, a terminal frontend and a daemon'
arch=('x86_64')
url='https://liveside.jifox.net'
license=('GPL-3.0-or-later')
depends=('gtk4' 'glib2' 'pango' 'cairo' 'graphene' 'libgcc' 'glibc' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=(
  'pipewire: sounds through pw-play'
  'libpulse: sounds through paplay, where PipeWire is not'
  'sound-theme-freedesktop: the default sounds'
  'streamlink: watching the stream from the window or the terminal'
  'python: the example bot'
)
# makepkg's LTO turns aws-lc's C code into GCC bitcode, which the linker
# Rust uses (lld) cannot read: every aws_lc symbol came out undefined.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/foxkyong/liveside/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p liveside-gui -p liveside-tui -p liveside-daemon
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/liveside-gui target/release/liveside-tui target/release/liveside-daemon
  install -Dm644 packaging/linux/net.jifox.liveside.Liveside.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/net.jifox.liveside.Liveside.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 packaging/linux/net.jifox.liveside.Liveside.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 packaging/linux/liveside-daemon.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 examples/bots/* -t "$pkgdir/usr/share/liveside/examples/bots"
  # What a user reads; the rest of docs/ is for whoever works on it.
  install -Dm644 README.md CHANGELOG.md docs/usage.md docs/bots.md docs/privacy.md -t "$pkgdir/usr/share/doc/$pkgname"
}

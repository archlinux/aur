# Maintainer: Arimil <renari at arimil dot com>
pkgname=stardb-exporter-git
pkgver=r224.8ae5bfa
pkgrel=1
pkgdesc="A Hoyoverse exporter for pulls and achievements"
arch=('x86_64')
url="https://github.com/juliuskreutz/stardb-exporter"
license=()
# The GUI loads X11, Wayland, keyboard and GL libraries dynamically.
depends=('glibc' 'libgcc' 'libpcap' 'libcap' 'libx11' 'libxcb'
         'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libglvnd' 'xdg-utils')
optdepends=('xdg-desktop-portal: native file dialogs (requires a desktop portal backend)')
makedepends=('git' 'cargo' 'openssl')
install=stardb-exporter.install
source=("git+$url.git")
sha256sums=('SKIP')
# ring's C objects cannot use makepkg's GCC LTO with Rust's linker.
options=('!lto')
provides=('stardb-exporter')
conflicts=('stardb-exporter')

pkgver() {
  cd "$srcdir/stardb-exporter"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/stardb-exporter"
  # Use the upstream debug-mode startup path in release builds: no self-update.
  # Fail if upstream changes the expected configuration guards.
  [[ $(grep -Fc '#[cfg(not(debug_assertions))]' src/app.rs) -eq 5 ]] || return 1
  [[ $(grep -Fc '#[cfg(debug_assertions)]' src/app.rs) -eq 1 ]] || return 1
  sed -i \
    -e 's/#\[cfg(not(debug_assertions))\]/#[cfg(any())]/g' \
    -e '/#\[cfg(debug_assertions)\]/d' \
    -e 's/state: State::Waiting(.*),/state: State::Menu,/' \
    src/app.rs
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/stardb-exporter"
  cargo build --release --frozen --features pcap --target-dir target
}

package() {
  cd "$srcdir/stardb-exporter"
  install -Dm755 "target/release/stardb-exporter" "$pkgdir/usr/bin/stardb-exporter"
}

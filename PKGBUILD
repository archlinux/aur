# Maintainer: teraflops <prietus@live.com>

pkgname=iperfgtk-git
_pkgname=iperfgtk
pkgver=0.1.0.r0.gabcdef0
pkgrel=1
pkgdesc="Modern native GTK4/libadwaita frontend for iperf3 with an analog VU-meter"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/iperfgtk"
license=('MIT')
depends=('gtk4' 'libadwaita' 'iperf3' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/prietus/iperfgtk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --offline
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --offline
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/iperf_rust" "$pkgdir/usr/bin/iperf_rust"
  install -Dm644 "data/io.github.iperf_rust.desktop" \
    "$pkgdir/usr/share/applications/io.github.iperf_rust.desktop"

  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "data/icons/hicolor/${s}x${s}/apps/io.github.iperf_rust.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/io.github.iperf_rust.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

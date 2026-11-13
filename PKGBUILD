# Maintainer: Hamdy Abou El Anein (hamdyaea)
# ShellTrace upstream: https://github.com/hamdyaea/ShellTrace
pkgname=shelltrace-git
pkgver=0.3.2.r52.g331faf9
pkgrel=1
pkgdesc='Linux command impact inspector (Rust CLI and Qt6 GUI)'
arch=('x86_64' 'aarch64')
url='https://github.com/hamdyaea/ShellTrace'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'strace' 'bubblewrap')
makedepends=('git' 'rust' 'cmake' 'gcc')
provides=('shelltrace')
conflicts=('shelltrace')
source=('ShellTrace::git+https://github.com/hamdyaea/ShellTrace.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ShellTrace"
  printf '0.3.2.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/ShellTrace"

  # Arch/Manjaro provides modern Rust in /usr/bin via makedepends=(rust).
  # An older ~/.cargo/bin/rustup shim can otherwise shadow it in makepkg.
  # Run the packaged toolchain, not an unrelated user-level rustup default.
  if [[ ! -x /usr/bin/cargo || ! -x /usr/bin/rustc ]]; then
    printf '%s\n' 'Missing system Rust toolchain (install the rust package).' >&2
    return 1
  fi
  export PATH="/usr/bin:$PATH"
  export RUSTC=/usr/bin/rustc
  export CARGO_HOME="${CARGO_HOME:-$srcdir/.cargo}"

  printf 'Cargo: %s\n' "$(/usr/bin/cargo --version)"
  printf 'Rust:  %s\n' "$(/usr/bin/rustc --version)"
  /usr/bin/cargo build --release --locked
  cmake -S gui -B build/gui -DCMAKE_BUILD_TYPE=Release
  cmake --build build/gui --parallel
}

package() {
  cd "$srcdir/ShellTrace"
  install -Dm755 target/release/shelltrace "$pkgdir/usr/bin/shelltrace"
  install -Dm755 build/gui/shelltrace-gui "$pkgdir/usr/bin/shelltrace-gui"
  install -Dm644 gui/shelltrace-gui.desktop "$pkgdir/usr/share/applications/shelltrace-gui.desktop"
  install -Dm644 assets/shelltrace-badge.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shelltrace.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

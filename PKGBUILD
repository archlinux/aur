# Maintainer: Hamdy Abou El Anein (hamdyaea)
# ShellTrace upstream: https://github.com/hamdyaea/ShellTrace
pkgname=shelltrace-git
pkgver=0.3.2.r0.g0000000
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
  export CARGO_HOME="${CARGO_HOME:-$srcdir/.cargo}"
  cargo build --release --locked
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

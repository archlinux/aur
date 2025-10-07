# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-git
pkgver=0.2.0.r24.geb5dbc07
pkgrel=1
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (git version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
depends=('pacman' 'curl')
optdepends=('paru: for AUR package installation'
            'yay: alternative AUR helper')
makedepends=('cargo' 'git')
conflicts=('pacsea' 'pacsea-bin')
source=("git+https://github.com/Firstp1ck/Pacsea.git")
sha256sums=('SKIP')

pkgver() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  git describe --tags --long --always \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  # Fetch dependencies according to Cargo.lock to ensure reproducible builds
  cargo fetch --locked
}

build() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  cargo build --release --locked
}

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  # The crate builds a binary named 'Pacsea'; install it as 'pacsea'
  install -Dm755 "target/release/Pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

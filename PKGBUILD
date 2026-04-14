pkgname=prism-tui-git
_pkgname=prism-tui
pkgver=0.3.0.r0.g0000000
pkgrel=1
pkgdesc="Terminal user interface for PrismLauncher"
arch=('x86_64')
url="https://github.com/OneNoted/Prism-TUI"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Prism-TUI"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$srcdir/Prism-TUI"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$srcdir/Prism-TUI"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo build --frozen --locked --release
}

check() {
  cd "$srcdir/Prism-TUI"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo test --frozen --locked
}

package() {
  cd "$srcdir/Prism-TUI"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: scottbass3 <valentin dot carroy at hotmail dot fr>

pkgname=scottbass3-clipd-git
_name=clipd
pkgver=r9.b5b6a4f
pkgrel=1
pkgdesc="Clipboard history daemon for Wayland, with pins organized in categories"
arch=('x86_64' 'aarch64')
url="https://github.com/scottbass3/clipd"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=('clipd')
conflicts=('clipd')
source=("$_name::git+$url.git")
sha256sums=('SKIP')
# The bundled SQLite would be built as GCC LTO bitcode, which rustc cannot link.
options=('!lto')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_name"
  install -Dm755 target/release/clipd -t "$pkgdir/usr/bin/"
  install -Dm644 contrib/clipd.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_name/"
}

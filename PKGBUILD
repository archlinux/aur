# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=quarry-sql
_pkgname=quarry
pkgver=0.2.0
pkgrel=1
pkgdesc='A fast SQL client and TUI for PostgreSQL, MySQL / MariaDB and SQLite'
arch=('x86_64')
url='https://github.com/mah3uz/quarry'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'openssh: SSH tunnels (--ssh)'
  'less: paging long results'
)
# The AUR's `quarry` (a board-game GUI) also installs /usr/bin/quarry.
conflicts=('quarry')
# makepkg's -flto turns the bundled C code (SQLite, aws-lc) into GCC LTO objects the Rust link can't resolve.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8807b4193053bad2104d54212715ef37b95abcf85e8a15b29ad005a62e602550')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Point the server tests at a closed port so they skip instead of using the builder's databases.
  export QUARRY_TEST_PG=postgres://quarry@127.0.0.1:1/none QUARRY_TEST_MYSQL=mysql://quarry@127.0.0.1:1
  cargo test --frozen --release --lib --test cli --test drivers
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/quarry -t "$pkgdir/usr/bin"
  install -d "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  target/release/quarry --completions bash > "$pkgdir/usr/share/bash-completion/completions/quarry"
  target/release/quarry --completions zsh > "$pkgdir/usr/share/zsh/site-functions/_quarry"
  target/release/quarry --completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/quarry.fish"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=vim-clap
pkgver=0.31
pkgrel=1
pkgdesc='Modern performant generic finder and dispatcher for Vim and Neovim'
arch=('x86_64')
url=https://github.com/liuchengxu/vim-clap
license=('MIT')
groups=('vim-plugins')
depends=('gcc-libs' 'vim-plugin-runtime')
makedepends=('python' 'cargo' 'libgit2')
optdepends=(
  'ctags: for the proj_tags provider'
  'git: for the bcommits, commits, files, gfiles or git_files, and git_diff_files providers'
  'python: for the Python dynamic module'
  'ripgrep: for the files and grep providers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7885781f9833d3caac9d2ed333ad6b55d6d4a895179a5e8171f39c3dd88c8f59')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's,/setup_python.py,/pythonx/clap/setup_python.py,' \
    autoload/clap/filter/sync/python.vim
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  cd "$srcdir/$pkgname-$pkgver/crates"
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  cd "$srcdir/$pkgname-$pkgver/pythonx/clap/fuzzymatch-rs"
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$pkgname-$pkgver"
  cargo build --release --frozen --all-features
  cd "$srcdir/$pkgname-$pkgver/crates"
  cargo build --release --frozen --all-features
  cd "$srcdir/$pkgname-$pkgver/pythonx/clap/fuzzymatch-rs"
  cargo build --release --frozen --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver/crates"
  cargo test --frozen --all-features
  cd "$srcdir/$pkgname-$pkgver/pythonx/clap/fuzzymatch-rs"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -D target/release/maple -t "$pkgdir/usr/bin/"
  install -Dm644 pythonx/clap/fuzzymatch-rs/target/release/libfuzzymatch_rs.so -t "$pkgdir/usr/lib/"
  install -Dm 644 setup_python.py -t "$pkgdir/usr/share/vim/vimfiles/pythonx/clap/"
  ln -s /usr/lib/libfuzzymatch_rs.so "$pkgdir/usr/share/vim/vimfiles/pythonx/clap/fuzzymatch_rs.so"
  find autoload doc ftplugin lua plugin syntax -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  find pythonx -name '*.py' -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  python -O -m compileall "$pkgdir/usr/share/vim/vimfiles/pythonx/clap/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

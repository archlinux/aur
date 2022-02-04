# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=vim-clap
pkgver=0.32
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
sha256sums=('aa86e359882df2260a4f9e87efdd8de631d4f89fec40634c950753f6796d5262')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's,/setup_python.py,/pythonx/clap/setup_python.py,' \
    autoload/clap/filter/sync/python.vim
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  for i in crates pythonx/clap/fuzzymatch-rs
  do
    ( cd "$i"
      cargo update
      cargo fetch --locked --target "$CARCH-unknown-linux-gnu" )
  done
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  for i in "$pkgname-$pkgver"{,/crates,/pythonx/clap/fuzzymatch-rs}
  do
    ( cd "$i"
      cargo build --release --frozen --all-features )
  done
}

# check() {
#   cd "$pkgname-$pkgver"
#   for i in crates pythonx/clap/fuzzymatch-rs
#   do
#     ( cd "$i"
#       cargo test --frozen --all-features )
#   done
# }

package() {
  cd "$pkgname-$pkgver"
  install -D target/release/maple -t "$pkgdir/usr/bin/"
  install -Dm644 pythonx/clap/fuzzymatch-rs/target/release/libfuzzymatch_rs.so -t "$pkgdir/usr/lib/"
  install -Dm644 setup_python.py -t "$pkgdir/usr/share/vim/vimfiles/pythonx/clap/"
  ln -s /usr/lib/libfuzzymatch_rs.so "$pkgdir/usr/share/vim/vimfiles/pythonx/clap/fuzzymatch_rs.so"
  find autoload doc ftplugin lua plugin syntax \
    -type f \
    -exec install \
    -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  find pythonx \
    -name '*.py' \
    -type f \
    -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  python -O -m compileall "$pkgdir/usr/share/vim/vimfiles/pythonx/clap/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

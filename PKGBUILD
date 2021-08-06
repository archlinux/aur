# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=vim-clap
pkgver=0.27
pkgrel=1
pkgdesc='Modern performant generic finder and dispatcher for Vim and NeoVim'
arch=('x86_64')
url=https://github.com/liuchengxu/vim-clap
license=('MIT')
groups=('vim-plugins')
depends=('gcc-libs')
makedepends=('python' 'rust')
optdepends=('ctags: for the proj_tags provider'
            'git: for the bcommits, commits, files, gfiles or git_files, and git_diff_files providers'
            'python: for the Python dynamic module'
            'ripgrep: for the files and grep providers')
source=("$url/archive/v$pkgver/vim-clap-$pkgver.tar.gz")
b2sums=('11357b28011b1632f044e6a2fbc3e9ddfca1a217169fb37768596b3a53ee3a1f2b34662525d2d66f7fd8d4eb93df4f6a80760c16c283f1bfe67a53a4ac3fcbff')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's,/setup_python.py,/pythonx/clap/setup_python.py,' \
    autoload/clap/filter/sync/python.vim
  cargo fetch --locked
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
  cd pythonx/clap/fuzzymatch-rs
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver/crates
  cargo test --release
  cd ../pythonx/clap/fuzzymatch-rs
  cargo test --no-default-features --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/maple
  install -Dm644 pythonx/clap/fuzzymatch-rs/target/release/libfuzzymatch_rs.so \
    "$pkgdir"/usr/lib/fuzzymatch_rs.so
  install -Dm644 -t "$pkgdir"/usr/share/vim/vimfiles/pythonx/clap \
    pythonx/clap/*.py setup_python.py
  ln -s /usr/lib/fuzzymatch_rs.so "$pkgdir"/usr/share/vim/vimfiles/pythonx/clap
  cp -r autoload doc ftplugin lua plugin syntax "$pkgdir"/usr/share/vim/vimfiles
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:

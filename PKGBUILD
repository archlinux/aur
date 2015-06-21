# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
pkgname=vim-rust-git
pkgver=r272.6932a6b
pkgrel=1
pkgdesc="Syntax and supporting functionality for the Rust filetype"
arch=('any')
url="https://github.com/rust-lang/rust.vim"
license=('Apache' 'MIT')
makedepends=('git')
optdepends=('rust: for RustRun and similar commands'
            'vim-syntastic: syntax checking')
install=vimdoc.install
source=('git://github.com/rust-lang/rust.vim.git'
        'git-manifest.txt'
        'LICENSE-APACHE' 'LICENSE-MIT')
sha256sums=('SKIP'
            '191917c474d89c63e4001d07fec4c2b1eda36b86d4e5677c9a5a47ad5e68d618'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2'
            '6485b8ed310d3f0340bf1ad1f47645069ce4069dcc6bb46c7d5c6faf41de1fdb')

pkgver() {
  cd $srcdir/rust.vim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install licenses.
  cd $srcdir
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # Install vim files.
  cd $srcdir/rust.vim
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 after/syntax/rust.vim "${vimfiles}/after/syntax/rust.vim"
  install -D -m644 autoload/rust.vim "${vimfiles}/autoload/rust.vim"
  install -D -m644 compiler/rustc.vim "${vimfiles}/compiler/rustc.vim"
  install -D -m644 compiler/cargo.vim "${vimfiles}/compiler/cargo.vim"
  install -D -m644 doc/rust.txt "${vimfiles}/doc/rust.txt"
  install -D -m644 ftdetect/rust.vim "${vimfiles}/ftdetect/rust.vim"
  install -D -m644 ftplugin/rust.vim "${vimfiles}/ftplugin/rust.vim"
  install -D -m644 indent/rust.vim "${vimfiles}/indent/rust.vim"
  install -D -m644 plugin/rust.vim "${vimfiles}/plugin/rust.vim"
  install -D -m644 syntax/rust.vim "${vimfiles}/syntax/rust.vim"
  install -D -m644 syntax_checkers/rust/rustc.vim "${vimfiles}/syntax_checkers/rust/rustc.vim"

  # Produce a warning if new files get added to the repo in the future.
  if ! find . | grep -v "./.git" | sort | diff - "${srcdir}/git-manifest.txt"
  then
    msg "WARNING: there are different files in the git repo, package may need updating."
  fi
}


# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=git-interactive-rebase-tool
pkgver=1.1.0
pkgrel=1
pkgdesc='Native cross platform full feature terminal based sequence editor for git interactive rebase. Written in Rust using ncurses.'
arch=('x86_64')
url='https://github.com/MitMaro/git-interactive-rebase-tool'
license=('ISC')
depends=('rust')
makedepends=('git' 'rust' 'cargo')
install=$pkgname.install
sha256sums=('SKIP')
source=('git+https://github.com/MitMaro/git-interactive-rebase-tool.git')

prepare() {
  cd $pkgname
  git checkout tags/$pkgver
  git clean -dfx
}

build() {
  cd $pkgname

  if [ $(which rustup > /dev/null 2>&1; echo $?) -eq 0 ]; then
    if [ $(rustup default > /dev/null 2>&1; echo $?) -ne 0 ]; then
      rustup default stable
    fi
  fi

  cargo build --release
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m755 target/release/interactive-rebase-tool $pkgdir/usr/bin/interactive-rebase-tool
  install -m644 src/interactive-rebase-tool.1 $pkgdir/usr/share/man/man1/interactive-rebase-tool.1
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
  gzip $pkgdir/usr/share/man/man1/interactive-rebase-tool.1
}


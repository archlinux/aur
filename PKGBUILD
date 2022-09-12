# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: Martin Kröning <m.kroening@hotmail.de>

pkgname=git-interactive-rebase-tool
_binname=interactive-rebase-tool
pkgver=2.2.0
pkgrel=1
pkgdesc='Native cross platform full feature terminal based sequence editor for git interactive rebase. Written in Rust using ncurses.'
arch=('x86_64' 'aarch64')
url='https://gitrebasetool.mitmaro.ca/'
license=('GPL3')
depends=('libgit2')
makedepends=('cargo')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MitMaro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4d60912c64a1ea25ff3e8a4beca0ecdb6a1c761f81e06f81ebc2a46119b8780c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ $(which rustup > /dev/null 2>&1; echo $?) -eq 0 ]; then
    if [ $(rustup default > /dev/null 2>&1; echo $?) -ne 0 ]; then
      rustup default stable
    fi
  fi

  cargo build --release --locked --target-dir=target
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked --target-dir=target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/interactive-rebase-tool"
  install -Dm644 "src/$_binname.1" "$pkgdir/usr/share/man/man1/interactive-rebase-tool.1"
}


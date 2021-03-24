# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: Martin Kröning <m.kroening@hotmail.de>

pkgname=git-interactive-rebase-tool
_binname=interactive-rebase-tool
pkgver=2.0.0
pkgrel=2
pkgdesc='Native cross platform full feature terminal based sequence editor for git interactive rebase. Written in Rust using ncurses.'
arch=('x86_64')
url='https://gitrebasetool.mitmaro.ca/'
license=('GPL3')
depends=('libgit2')
makedepends=('cargo')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MitMaro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('572815b6bf152cae9414635caf9c8c918a575747c3a8885767380da4aeeeb709')

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


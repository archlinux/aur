# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-git
pkgver=2.6.7.dev_r1657.g97e0011
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=($CARCH)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
makedepends=(git rust)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'version = ' Cargo.toml | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  git submodule update --init --recursive
}

build() {
  cd ${pkgname%-git}
  cargo build --release -vv --
}

package() {
  install -Dm755 ${pkgname%-git}/target/release/fishnet -t "$pkgdir/usr/bin/"
}

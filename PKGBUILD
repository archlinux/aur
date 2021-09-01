# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bat-extras
pkgver=2021.08.21
pkgrel=2
pkgdesc="Bash scripts that integrate bat with various command line tools"
arch=('any')
url="https://github.com/eth-p/bat-extras"
license=('MIT')
depends=('bat' 'bash' 'git' 'ripgrep' 'man-db')
optdepends=(
  'ncurses: optional for batdiff script'
  'git-delta: optional for batdiff script'
  'fzf: optional for batman script'
  'exa: optional for batpipe script'
  'entr: optional for batwatch script'
  'prettier: various code formatting for prettybat script'
  'shfmt: bash formatting for prettybat script'
  'rustfmt: Rust formatting for prettybat script'
  'clang: C / C++ / Objective-C formatting for prettybat script'
  'python-black: Python formatting for prettybat script'
)
checkdepends=('fish')
_commit='7803ecaba1e78adacc277e82b2568cca007b1ba0'
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare(){
  cd "$pkgname"
  git submodule update --init --recursive
}

check() {
  cd "$pkgname"
  ./test.sh --verbose --strict --snapshot:show
}

package() {
  cd "$pkgname"
  ./build.sh \
    --minify=none \
    --no-verify \
    --prefix="$pkgdir/usr" \
    --install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTING.md README.md doc/*
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

# Maintainer: Jiuyang Liu <liu@jiuyang.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator-git
_pkgname=verilator
pkgver=r5482.f6f13c7fd
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url='https://www.veripool.org/projects/verilator/wiki/Intro'
arch=('x86_64')
license=('LGPL')
depends=('perl')
optdepends=('systemc')
# lsb-release is used by configure script to enable usage of c++17
makedepends=('python' 'systemc' 'lsb-release' 'git')
conflicts=('verilator')
provides=('verilator')
source=(
  "verilator::git+https://github.com/verilator/verilator.git"
  "3694.diff"
)
sha512sums=('SKIP'
            'bc9a86041442a2dd14f2de6dbce3b29601998599b0054c5e23173ac909bbb5ef6da8c35c28121eac7155ccdee88cf42b3e0ab2addebd6d20ba89cf0729e5f25e')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git apply $srcdir/3694.patch
  autoconf
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"
  make install DESTDIR="$pkgdir"
}

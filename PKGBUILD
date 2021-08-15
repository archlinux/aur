# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>

pkgname=gn-m76
pkgver=0.1576.81ee1967
_commit=81ee1967d3fcbc829bac1c005c3da59739c88df9
pkgrel=1
pkgdesc="Meta-build system that generates build files for Ninja"
pkgdesc+=" (version shipped in Chromium 76; for building electron{4,5,6})"
arch=('x86_64')
url="https://gn.googlesource.com/gn/"
license=('BSD')
depends=('gcc-libs')
makedepends=('clang' 'ninja' 'python' 'git')
source=(git+https://gn.googlesource.com/gn#commit=$_commit)
md5sums=('SKIP')

pkgver() {
  cd gn
  echo 0.$(git rev-list --count initial-commit..).$(git rev-parse --short HEAD)
}

prepare() {
  cd gn
  # Make exec_process_unittest.cc work with Python 3
  git cherry-pick -n a3e0807fdd7a1fde37d73add8c1581136f58c104
}

build() {
  cd gn
  ./build/gen.py
  ninja -C out
}

check() {
  cd gn
  ./out/gn_unittests
}

package() {
  cd gn
  install -D out/gn "$pkgdir/usr/bin/gn-m76"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

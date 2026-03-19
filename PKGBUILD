# Maintainer: Valerii Huz <ghotrix at gmail dot com>

pkgname=lc0-cudnn-git
_pkgname=lc0-cudnn
pkgver=0.32.1.r0.gfd71a2d
pkgrel=1
options=(!debug)
pkgdesc="CUDNN-enabled version of Leela Chess Zero"
arch=('x86_64')
url="https://github.com/LeelaChessZero/lc0"
license=('GPL-3.0-only')
depends=('cuda' 'cudnn' 'protobuf')
makedepends=('git' 'meson>=0.46' 'ninja')
provides=('lc0-cudnn')
conflicts=('lc0-cudnn')
_branch=release/0.32
source=("$_pkgname::git+https://github.com/LeelaChessZero/lc0.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags --abbrev=7 \
    | sed 's/^v//; s/\([^-]*\)-\([0-9]*\)-g\(.*\)/\1.r\2.g\3/; s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_pkgname"
  PATH+=":/opt/cuda/bin"
  ./build.sh release -Dblas=false -Dopencl=false
}

package() {
  cd "$srcdir/$_pkgname/build/release"

  install -Dm755 lc0 "$pkgdir/usr/bin/lc0"
}

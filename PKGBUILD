# Maintainer: Arnab Bose <hirak99+arch@gmail.com>

pkgname=keyshift
pkgver=1.0.6
pkgrel=1
pkgdesc="Keyshift - keyboard remapping utility for Linux"
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
depends=()
makedepends=('catch2')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "git+https://github.com/kerukuro/digestpp.git"
)
md5sums=(
  'bf093d724fe4f489aaf7e36d9a974d1e'
  'SKIP'
)
options=(!debug)

# For -git, I think we may be able to use something like below.
# See this post for some info: https://bbs.archlinux.org/viewtopic.php?id=300329
# prepare() {
#   cd "$pkgname"-"$pkgver"
#   repo="."
#   git -C $repo submodule init
#   git -C $repo config submodule.src/thirdparty/digestpp.url "file://$srcdir/digestpp"
#
#   git submodule update
# }

# As we are building from a release tag, git isn't initialized.
# Instead we just point to the downloaded directory.
prepare() {
  cd "$pkgname"-"$pkgver"
  # This directory is not pulled from tag; should be empty if it exists.
  rm -rf ./src//thirdparty/digestpp
  pwd
  ls
  ln -sf "$srcdir/digestpp" ./src/thirdparty/digestpp
}

package() {
  cd "$pkgname"-"$pkgver"
  ./build_minimal.sh

  install -Dm 755 ./build/keyshift "$pkgdir"/usr/bin/keyshift
}


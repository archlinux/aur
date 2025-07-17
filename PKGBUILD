# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=lsr-git
pkgver=v1.0.0.r17.g833935b
pkgrel=1
pkgdesc="ls but with io_uring"
arch=('x86_64')
url="https://github.com/rockorager/lsr.git"
license=('MIT')
makedepends=('zig>=0.15.1')
source=("$pkgname::git+$url")
md5sums=('SKIP')
provides=('lsr')
conflicts=('lsr')

pkgver() {
  cd "$pkgname" || exit 1
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname" || exit 1
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache/"
  zig build --fetch
}

build() {
  cd "$pkgname" || exit 1
  DESTDIR=build zig build \
                --summary all \
                --prefix "/usr" \
                --system "$srcdir/zig-global-cache/p" \
                -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname" || exit 1
  cp -a build/* "$pkgdir/"
}

# vim:set ts=2 sw=2 et:


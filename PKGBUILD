# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
pkgname=lsr-git
pkgver=v1.0.0.r17.g833935b
pkgrel=1
pkgdesc="ls but with io_uring"
arch=('x86_64')
url="https://github.com/rockorager/lsr.git"
license=('MIT')
makedepends=('zig>=0.15.1' 'git')
source=("$pkgname::git+$url")
md5sums=('SKIP')
provides=('lsr')
conflicts=('lsr')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache/"
  zig build --fetch
}

build() {
  cd "$pkgname"
  DESTDIR=build zig build \
                --summary all \
                --prefix "/usr" \
                --system "$srcdir/zig-global-cache/p" \
                -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname"
  cp -a build/* "$pkgdir/"
}

# vim:set ts=2 sw=2 et:


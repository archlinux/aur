# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=zchunk-git
pkgver=1.0.1
pkgrel=1
pkgdesc="A file format that allows easy deltas while maintaining good compression (git version)"
arch=(x86 x86_64)
url="https://github.com/zchunk/zchunk"
license=('BSD')
depends=('libcurl.so' 'zstd')
makedepends=('meson')
provides=('zchunk' 'libzck.so')
conflicts=('zchunk')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  arch-meson build/
  ninja -C build/
}

check() {
  cd "$srcdir/$pkgname/build"
  meson test
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir/" ninja -C build/ install
}

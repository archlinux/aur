# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=casync-git
pkgver=2.r267.g0efa7ab
pkgrel=1
pkgdesc="Content-Addressable Data Synchronization Tool"
arch=(x86 x86_64)
url="https://github.com/systemd/casync"
license=('LGPL')
depends=('acl' 'fuse2' 'libcurl.so' 'libudev.so' 'openssl' 'xz' 'zlib' 'zstd')
makedepends=('git' 'meson' 'python-sphinx')
optdepends=()
checkdepends=('rsync')
provides=('casync')
conflicts=('casync')
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
  arch-meson build/ -Dselinux=false
  ninja -C build/
}

#check() {
#  cd "$srcdir/$pkgname/build"
#  meson test
#}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir/" ninja -C build/ install
}

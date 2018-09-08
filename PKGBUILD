# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=casync-git
pkgver=2.r152.ge4a3c5e
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
source=("$pkgname::git+$url" 'renameat2-test-fix.patch')
sha256sums=('SKIP'
            '3fb0fc4965039d0fc5b51c8fe49bb7ad74108324ff921c6f5b74127036c28d51')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/renameat2-test-fix.patch"
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

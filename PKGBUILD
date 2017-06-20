# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=casync-git
pkgver=1
pkgrel=1
pkgdesc="Content-Addressable Data Synchronization Tool"
arch=(x86 x86_64)
url="https://github.com/systemd/casync"
license=('LGPL')
depends=('acl' 'libcurl.so' 'libgcrypt' 'xz')
makedepends=('git')
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
  meson --buildtype=release --prefix=/usr build/
  ninja -C build/
}

#check() {
#  cd "$srcdir/$pkgname"
#  ninja -C build/ test
#}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir/" ninja -C build/ install
}

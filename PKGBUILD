# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: S\u00e9bastien Luttringer
# Contributor: Lawrence Lee <valheru@facticius.net>
# Contributor: Phillip Marvin <phillip.marvin@gmail.com>
# Contributor: keystone <phillip.marvin@gmail.com>

pkgname=libunwind-git
pkgver=1.7.2.r146.g24dc3b08
pkgrel=1
pkgdesc="Portable and efficient C programming interface (API) to determine the call-chain of a program"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/libunwind/"
license=('MIT')
depends=('glibc' 'xz' 'zlib')
makedepends=('git' 'texlive-core')
provides=("libunwind=$pkgver")
conflicts=('libunwind')
options=('staticlibs')
source=("git+https://github.com/libunwind/libunwind.git")
sha256sums=('SKIP')


pkgver() {
  cd "libunwind"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libunwind"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libunwind"

  make check
}

package() {
  cd "libunwind"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libunwind"
}

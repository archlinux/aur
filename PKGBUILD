# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=mupen64plus-rsp-cxd4-git
pkgver=2.5.9.r2.g1836a43
pkgrel=1
pkgdesc="Exemplary MSP communications simulator using a normalized VU."
arch=('i686' 'x86_64')
url="https://github.com/mupen64plus/mupen64plus-rsp-cxd4"
license=('custom:CC0')
depends=(glibc)
provides=(mupen64plus-rsp-cxd4)
conflicts=(mupen64plus-rsp-cxd4)
makedepends=(git)
source=("git+https://github.com/mupen64plus/mupen64plus-rsp-cxd4")
sha256sums=('SKIP')
_name=mupen64plus-rsp-cxd4

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_name/projects/unix"
  make all SSE=SSE3 PIC=1
}
package() {
  cd "$_name/projects/unix"
  make install DESTDIR="$pkgdir/" SSE=SSE3 PIC=1 PREFIX=/usr
  install -Dm644 ../../COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

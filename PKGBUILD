# Maintainer: CJacob314 <jacob AT jacobcohen DOT info>

pkgname=strace-libdw-git
pkgver=r0.0
pkgrel=1
pkgdesc="A diagnostic, debugging and instructional userspace tracer with libdw support for better, source-aware backtraces"
arch=('x86_64')
url="https://strace.io/"
license=('0BSD')

# libelf for libdw, GLIBC obvious
depends=('glibc' 'libelf')

# Some strace test scripts use perl
optdepends=('perl')
makedepends=('git' 'make')
provides=("strace=$pkgver")
conflicts=('strace')
source=("git+https://github.com/strace/strace.git")
sha256sums=('SKIP')


pkgver() {
  cd "strace"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "strace"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --with-libdw
	make -j4
}

check() {
  cd "strace"

  make check
}

package() {
  cd "strace"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/strace"
}

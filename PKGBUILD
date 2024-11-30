# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf-git
pkgver=1.5.0.r22.gc5f22aca
pkgrel=3
pkgdesc="Library for loading eBPF programs and reading and manipulating eBPF objects from user-space"
arch=('i686' 'x86_64')
url="https://github.com/libbpf/libbpf"
license=('BSD-2-Clause' 'LGPL-2.1-or-later')
depends=('glibc' 'libelf' 'zlib')
makedepends=('git' 'linux-api-headers')
provides=("libbpf=$pkgver" 'libbpf.so')
conflicts=('libbpf')
options=('staticlibs')
source=("git+https://github.com/libbpf/libbpf.git")
sha256sums=('SKIP')


pkgver() {
  cd "libbpf"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libbpf"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make -C "src"
}

package() {
  cd "libbpf"

  make \
    -C "src" \
    DESTDIR="$pkgdir" \
    LIBSUBDIR="lib" \
    install \
    install_headers
  install -Dm644 "LICENSE.BSD-2-Clause" -t "$pkgdir/usr/share/licenses/libbpf"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/libbpf"
}

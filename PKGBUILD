# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=libdwarf-git
pkgver=0.7.0.r318.gdf4cc3f4
pkgrel=1
pkgdesc="A library for handling DWARF debugging information format"
arch=('i686' 'x86_64')
url="https://www.prevanders.net/dwarf.html"
license=('GPL' 'LGPL')
depends=('glibc' 'zlib' 'zstd')
makedepends=('git')
checkdepends=('python')
provides=("libdwarf=$pkgver" 'libdwarf.so')
conflicts=('libdwarf')
options=('staticlibs')
source=("git+https://github.com/davea42/libdwarf-code.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdwarf-code"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libdwarf-code"

  sh autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-shared
  make
}

check() {
  cd "libdwarf-code"

  make check
}

package() {
  cd "libdwarf-code"

  make DESTDIR="$pkgdir" install
}

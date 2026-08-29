# Maintainer:
# Contributor: Fabio Comuni <fabrix.xm@gmail.com>

_pkgname="quirc"
pkgname="$_pkgname-llvm"
pkgver=1.2
pkgrel=5
pkgdesc="QR decoder library — built with Clang and LLVM lld"
url="https://github.com/dlbeer/quirc"
license=('ISC')
arch=('i686' 'x86_64')

depends=(
  'libjpeg-turbo'
  'sdl_gfx'
  'sdl12-compat'
)
makedepends=('clang' 'lld' 'llvm')
provides=('quirc')
conflicts=('quirc')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
        'use-llvm-binutils.patch')
sha256sums=('73c12ea33d337ec38fb81218c7674f57dba7ec0570bddd5c7f7a977c0deb64c5'
            '9d3a2d7ea1e48d108de58df25a7aeaab449d47e7f07ad095a95573ac847565f1')

prepare() {
  patch -d "$_pkgsrc" -Np1 -i "$srcdir/use-llvm-binutils.patch"
}

build() {
  cd "$_pkgsrc"
  export CC=clang
  export CXX=clang++
  export AR=/usr/bin/llvm-ar
  export RANLIB=/usr/bin/llvm-ranlib
  export LD=clang
  export NM=/usr/bin/llvm-nm
  export OBJCOPY=/usr/bin/llvm-objcopy
  export OBJDUMP=/usr/bin/llvm-objdump
  export READELF=/usr/bin/llvm-readelf
  export STRIP=/usr/bin/llvm-strip
  export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
  export CFLAGS="${CFLAGS:-} -O3 -march=native -fPIC"
  export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
  make CC=clang CXX=clang++ AR=llvm-ar RANLIB=llvm-ranlib LD=clang libquirc.so quirc-demo quirc-scanner
}

package() {
  cd "$_pkgsrc"
  install -Dm644 "lib/quirc.h" "$pkgdir/usr/include/quirc.h"

  install -Dm644 "libquirc.so.$pkgver" -t "$pkgdir/usr/lib/"
  ln -s "libquirc.so.$pkgver" "$pkgdir/usr/lib/libquirc.so"

  install -Dm755 quirc-demo -t "$pkgdir/usr/bin/"
  install -Dm755 quirc-scanner -t "$pkgdir/usr/bin/"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

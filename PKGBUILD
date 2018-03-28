# $Id$
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_target=aarch64-linux-gnu
pkgname=${_target}-libffi
_pkgname=libffi
pkgver=3.2.1
pkgrel=1
pkgdesc='Portable foreign function interface library'
arch=('any')
url='http://sourceware.org/libffi/'
license=('MIT')
depends=("${_target}-glibc")
source=(ftp://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
sha1sums=('280c265b789e041c02e5c97815793dfc283fb1e6')

build() {
  cd $_pkgname-$pkgver
if [ n != "$RUN_PREPARE" ]; then
  if [ 1 = "$ccache" ]; then
    export CC=${CC:-ccache ${_target}-gcc}
    export CXX=${CXX:-ccache ${_target}-g++}
  fi
  unset CFLAGS CXXFLAGS
  ./configure --prefix=/usr/${_target} --disable-static \
    --host=${_target} \
    --enable-pax_emutramp
fi
  make
}

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

check() {
  local s readelfarch
  readelfarch='AArch64'
  cd $_pkgname-$pkgver

  s=$(find . -type f "(" -name "*.so*" -o -name "*.a" ")" -print0 | \
    2>/dev/null LC_ALL=C xargs -0 readelf -h | \
    sed -n -e '/File:/h;/Machine:/{/'"$readelfarch"'/!{H;x;p}}' | head -10)

  if [ -n "$s" ]; then
    >&2 echo "some binaries have wrong architecture:"
    >&2 echo "$s"
    return 1
  fi
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/${_target}/share/licenses/$_pkgname/LICENSE
}

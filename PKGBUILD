# $Id$
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_target=aarch64-linux-gnu
_pkgname=expat
pkgname=${_target}-expat
pkgver=2.2.5
pkgrel=1
pkgdesc='An XML parser library'
arch=('any')
url='https://libexpat.github.io/'
license=(custom)
depends=(${_target}-glibc)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6')

build() {
  cd $_pkgname-$pkgver
  unset CFLAGS CXXFLAGS
  ./configure --prefix=/usr/${_target} \
    --host=${_target} \
    --disable-static
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
  install -Dm644 "-t$pkgdir/usr/${_target}/share/licenses/$_pkgname" COPYING
}

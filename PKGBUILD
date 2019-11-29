pkgname=mingw-w64-libbacktrace-git
pkgver=r21.5a99ff7
pkgrel=1
pkgdesc="Library to produce symbolic backtraces (mingw-w64)"
arch=('any')
url="https://github.com/ianlancetaylor/libbacktrace"
license=('BSD')
depends=('mingw-w64-zlib')
makedepends=('mingw-w64-configure' 'git')
provides=('mingw-w64-libbacktrace')
conflicts=('mingw-w64-libbacktrace')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/ianlancetaylor/libbacktrace.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "libbacktrace"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "libbacktrace"
  # dont allow undefined symbols to build the dll
  sed -i "83ilibbacktrace_la_LDFLAGS = -no-undefined" Makefile.am
  # unknown macro AM_ENABLE_MULTILIB
  sed -i "s|AM_ENABLE_MULTILIB(, ..)|AC_MSG_NOTICE(["hello"])|g" configure.ac
  autoreconf -vfi
}

build() {
  cd "libbacktrace"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    OBJCOPY=/usr/bin/${_arch}-objcopy ${_arch}-configure ..
    make
    popd
  done
}

check() {
  cd "libbacktrace"
  for _arch in ${_architectures}; do
    cd "$srcdir/libbacktrace/build-${_arch}"
    make check
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libbacktrace/build-${_arch}"
    make DESTDIR="$pkgdir/" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


pkgname=mingw-w64-crt
pkgver=7.0.0
pkgrel=1
pkgdesc='MinGW-w64 CRT for Windows'
arch=('any')
url='http://mingw-w64.sourceforge.net'
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
makedepends=('mingw-w64-gcc-base' 'mingw-w64-binutils' "mingw-w64-headers=${pkgver}")
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
validpgpkeys=('CAF5641F74F7DFBA88AE205693BDB53CD4EBC740')
source=(https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2{,.sig})
sha256sums=('aa20dfff3596f08a7f427aab74315a6cb80c2b086b4a107ed35af02f9496b628'
            'SKIP')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  for _target in ${_targets}; do
    msg "Building ${_target} CRT"
    if [ ${_target} == "i686-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib64 --enable-lib32"
    elif [ ${_target} == "x86_64-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib32 --enable-lib64"
    fi
    mkdir -p "$srcdir"/crt-${_target} && cd "$srcdir"/crt-${_target}
    "$srcdir"/mingw-w64-v${pkgver}/mingw-w64-crt/configure --prefix=/usr/${_target} \
        --host=${_target} --enable-wildcard \
        ${_crt_configure_args}
    make
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} crt"
    cd "$srcdir"/crt-${_target}
    make DESTDIR="$pkgdir" install
  done
}

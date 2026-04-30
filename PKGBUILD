# Maintainer: bemxio <bemxiov@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mingw-w64-crt-msvcrt
pkgver=14.0.0
pkgrel=1
pkgdesc='MinGW-w64 CRT for Windows (w/ MSVCRT as C runtime library)'
arch=('any')
url='http://mingw-w64.sourceforge.net'
license=('LicenseRef-custom')
groups=('mingw-w64-toolchain-msvcrt' 'mingw-w64-msvcrt')
makedepends=('mingw-w64-gcc' 'mingw-w64-binutils' "mingw-w64-headers-msvcrt=${pkgver}")
provides=("mingw-w64-crt=${pkgver}")
conflicts=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
validpgpkeys=('CAF5641F74F7DFBA88AE205693BDB53CD4EBC740')
source=(https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2{,.sig})
sha512sums=('17378a0e2abbbb688468a78cb0ba261f9001a1bc6e7d0270c24c4b8b13e5c6513e8fb8e617d08102fbc772c288ad81ec3a43ca756ed28f17cc5543f717a8bb6d'
            'SKIP')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  for _target in ${_targets}; do
    echo "Building ${_target} CRT"
    if [ ${_target} == "i686-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib64 --enable-lib32"
    elif [ ${_target} == "x86_64-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib32 --enable-lib64"
    fi
    mkdir -p "$srcdir"/crt-${_target} && cd "$srcdir"/crt-${_target}
    "$srcdir"/mingw-w64-v${pkgver}/mingw-w64-crt/configure --prefix=/usr/${_target} \
        --host=${_target} --enable-wildcard \
        --with-default-msvcrt=msvcrt \
        ${_crt_configure_args}
    make
  done
}

package() {
  for _target in ${_targets}; do
    echo "Installing ${_target} crt"
    cd "$srcdir"/crt-${_target}
    make DESTDIR="$pkgdir" install
  done
  # Licenses
  install -Dm644 "$srcdir"/mingw-w64-v${pkgver}/COPYING.MinGW-w64/COPYING.MinGW-w64.txt "$pkgdir"/usr/share/licenses/${pkgname}/COPYING.MinGW-w64.txt
  install -Dm644 "$srcdir"/mingw-w64-v${pkgver}/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt "$pkgdir"/usr/share/licenses/${pkgname}/COPYING.MinGW-w64-runtime.txt
  install -Dm644 "$srcdir"/mingw-w64-v${pkgver}/mingw-w64-headers/ddk/readme.txt "$pkgdir"/usr/share/licenses/${pkgname}/ddk-readme.txt
}

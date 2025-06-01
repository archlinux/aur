# Maintainer: bemxio <bemxiov@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mingw-w64-headers-msvcrt
pkgver=12.0.0
pkgrel=1
pkgdesc="MinGW-w64 headers for Windows (with MSVCRT as default C runtime library)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('LicenseRef-custom')
groups=('mingw-w64-toolchain-msvcrt' 'mingw-w64-msvcrt')
provides=("mingw-w64-headers=${pkgver}")
conflicts=('mingw-w64-headers')
options=('!strip' '!libtool' '!emptydirs')
validpgpkeys=('CAF5641F74F7DFBA88AE205693BDB53CD4EBC740') # JonY <jon_y@users.sourceforge.net>
source=(https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2{,.sig})
sha512sums=('949b2bfab8763ab10ec4e9fdfdaf5361517a4ab787fb98ab419b38d02694061c2e821ebbf6e2e4b39d92bdf17419d116daa8e63afd9e01d11592f39df4da69d7'
            'SKIP')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _target in ${_targets}; do
    echo "Configuring ${_target} headers"
    mkdir -p "$srcdir"/headers-${_target} && cd "$srcdir"/headers-${_target}
    "$srcdir"/mingw-w64-v${pkgver}/mingw-w64-headers/configure --prefix=/usr/${_target} --enable-sdk=all --host=${_target} --with-default-msvcrt=msvcrt
  done
}

package() {
  for _target in ${_targets}; do
    echo "Installing ${_target} headers"
    cd "$srcdir"/headers-${_target}
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_target}/include/pthread_signal.h
    rm "$pkgdir"/usr/${_target}/include/pthread_time.h
    rm "$pkgdir"/usr/${_target}/include/pthread_unistd.h
  done

  echo "Installing MinGW-w64 licenses"
  install -Dm644 "$srcdir"/mingw-w64-v${pkgver}/COPYING.MinGW-w64/COPYING.MinGW-w64.txt "$pkgdir"/usr/share/licenses/${pkgname}/COPYING.MinGW-w64.txt
  install -Dm644 "$srcdir"/mingw-w64-v${pkgver}/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt "$pkgdir"/usr/share/licenses/${pkgname}/COPYING.MinGW-w64-runtime.txt
  install -Dm644 "$srcdir"/mingw-w64-v${pkgver}/mingw-w64-headers/ddk/readme.txt "$pkgdir"/usr/share/licenses/${pkgname}/ddk-readme.txt
}

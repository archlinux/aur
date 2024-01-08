# Maintainer: bemxio <bemxiov@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mingw-w64-headers-xp
pkgdesc="MinGW-w64 headers for Windows (compiled for Windows XP target support)"

pkgver=11.0.0
pkgrel=1

arch=(any)

url="http://mingw-w64.sourceforge.net"
license=("custom")

provides=(mingw-w64-headers)
conflicts=(mingw-w64-headers)

source=("https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2")
md5sums=("6c621754f7076548e57cfc432ec6de51")

options=("!strip" "!libtool" "!emptydirs")

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    for _target in ${_targets}; do
        # make a build directory and move into it
        mkdir -p "${srcdir}/headers-${_target}" && cd "${srcdir}/headers-${_target}"
        
        # configure the build
        "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-headers/configure" \
            --prefix="/usr/${_target}" \
            --host="${_target}" \
            --enable-sdk=all \
            --with-default-win32-winnt=0x501
    done
}

package() {
    for _target in ${_targets}; do
        # move to the build directory
        cd "${srcdir}/headers-${_target}"
        
        # install the headers
        make DESTDIR="${pkgdir}" install

        # remove headers that are provided by `mingw-w64-winpthreads`
        rm "${pkgdir}/usr/${_target}/include/pthread_signal.h"
        rm "${pkgdir}/usr/${_target}/include/pthread_time.h"
        rm "${pkgdir}/usr/${_target}/include/pthread_unistd.h"
    done

    # install license files
    install -Dm644 "${srcdir}/mingw-w64-v${pkgver}/COPYING.MinGW-w64/COPYING.MinGW-w64.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64.txt"
    install -Dm644 "${srcdir}/mingw-w64-v${pkgver}/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64-runtime.txt"
    install -Dm644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-headers/ddk/readme.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ddk-readme.txt"
}
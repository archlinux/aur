# Maintainer: pineappletoad

pkgname=arm-linux-gnueabihf-gcc-bin
_toolchain_ver=15.2.rel1
_toolchain_date=20251217
pkgver=${_toolchain_ver}.${_toolchain_date}
pkgrel=1
pkgdesc="Cross GCC for the arm-linux-gnueabihf target (precompiled, split from ARM's official GNU toolchain release)"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later' 'GCC-exception-3.1')
options=('!debug' '!strip')
provides=('arm-linux-gnueabihf-gcc')
conflicts=('arm-linux-gnueabihf-gcc')
depends=('arm-linux-gnueabihf-binutils' 'arm-linux-gnueabihf-glibc' 'arm-linux-gnueabihf-glibc-headers')

_tarball="arm-gnu-toolchain-${_toolchain_ver}-x86_64-arm-none-linux-gnueabihf"
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${_toolchain_ver}/binrel/${_tarball}.tar.xz")
sha256sums=('f0a6c95a9eda555c6cff02f4aa7ca0a7744526e85ff0000dc45e5599c59002f0')

package() {
    cd "${srcdir}/${_tarball}"

    # Everything in bin/ that isn't one of arm-linux-gnueabihf-binutils-bin's
    # tools belongs here (gcc, g++, cpp, gcov*, gdb, lto-dump, gfortran, ...) -
    # exclude by name rather than an explicit include list so new tool names
    # in future GCC releases are picked up automatically.
    local _binutils_tools=(addr2line ar as c++filt dwp elfedit gprof ld ld.bfd ld.gold nm objcopy objdump ranlib readelf size strings)

    install -d "${pkgdir}/usr/bin"
    for f in bin/arm-none-linux-gnueabihf-*; do
        local _tool="${f##*arm-none-linux-gnueabihf-}"
        local _is_binutils=0
        for _bt in "${_binutils_tools[@]}"; do
            [ "${_tool}" = "${_bt}" ] && _is_binutils=1 && break
        done
        [ "${_is_binutils}" -eq 1 ] && continue
        install -m755 "$f" "${pkgdir}/usr/bin/"
    done

    cd "${pkgdir}/usr/bin"
    for f in arm-none-linux-gnueabihf-*; do
        ln -s "$f" "${f/arm-none-linux-gnueabihf/arm-linux-gnueabihf}"
    done
    cd "${srcdir}/${_tarball}"

    install -d "${pkgdir}/usr/lib"
    cp -a lib/gcc "${pkgdir}/usr/lib/"

    install -d "${pkgdir}/usr/libexec"
    cp -a libexec/gcc "${pkgdir}/usr/libexec/"

    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

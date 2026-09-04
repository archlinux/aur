# Maintainer: pineappletoad

pkgname=arm-linux-gnueabihf-binutils-bin
_toolchain_ver=15.2.rel1
_toolchain_date=20251217
pkgver=${_toolchain_ver}.${_toolchain_date}
pkgrel=1
pkgdesc="Cross binutils for the arm-linux-gnueabihf target (precompiled, split from ARM's official GNU toolchain release)"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL-2.0-or-later' 'GPL-3.0-or-later' 'LGPL-2.1-or-later')
options=('!debug' '!strip')
provides=('arm-linux-gnueabihf-binutils')
conflicts=('arm-linux-gnueabihf-binutils')

_tarball="arm-gnu-toolchain-${_toolchain_ver}-x86_64-arm-none-linux-gnueabihf"
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${_toolchain_ver}/binrel/${_tarball}.tar.xz")
sha256sums=('bd9cbce4e245d4e7ca39fda88fed8641316934c2ebda8bcd5022ce905d149926')

package() {
    cd "${srcdir}/${_tarball}"

    local _tools=(addr2line ar as c++filt dwp elfedit gprof ld ld.bfd ld.gold nm objcopy objdump ranlib readelf size strings)

    install -d "${pkgdir}/usr/bin"
    for _tool in "${_tools[@]}"; do
        install -m755 "bin/arm-none-linux-gnueabihf-${_tool}" "${pkgdir}/usr/bin/"
    done

    # Arch-conventional arm-linux-gnueabihf-* symlinks alongside ARM's own
    # arm-none-linux-gnueabihf-* naming - same technique the real
    # arm-gnu-toolchain-*-bin AUR package uses, so anything expecting either
    # naming convention finds a working binary.
    cd "${pkgdir}/usr/bin"
    for f in arm-none-linux-gnueabihf-*; do
        ln -s "$f" "${f/arm-none-linux-gnueabihf/arm-linux-gnueabihf}"
    done
    cd "${srcdir}/${_tarball}"

    install -d "${pkgdir}/usr/arm-none-linux-gnueabihf/bin"
    cp -a arm-none-linux-gnueabihf/bin/. "${pkgdir}/usr/arm-none-linux-gnueabihf/bin/"

    if [ -d lib/bfd-plugins ]; then
        install -d "${pkgdir}/usr/lib/bfd-plugins"
        cp -a lib/bfd-plugins/. "${pkgdir}/usr/lib/bfd-plugins/"
    fi

    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

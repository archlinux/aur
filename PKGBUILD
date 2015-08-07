#NOTE: Download ADL_SDK8.zip manually from
#http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/
#and paste it next to this PKGBUILD

# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Contributor: mid-kid <esteve.varela@gmail.com>


pkgname="amd-adl-sdk"
pkgver=8.0
pkgrel=1
pkgdesc="API to access display driver functionality for AMD graphics cards."
arch=('i686' 'x86_64')
url="http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/"
license=('AMD-ADL')
depends=('catalyst-utils' 'gcc')
install=${pkgname}.install
options=('!strip')

DLAGENTS="http::/usr/bin/curl -fL --data 'amd_developer_central_nonce=e7863d3f69&_wp_http_referer=/tools-and-sdks/graphics-development/display-library-adl-sdk/&f=QURMX1NES182LjAuemlw' --retry 3 --retry-delay 3 -o %o"

source=("ADL_SDK8.zip::${url}")
md5sums=('f3022bf9101fd9d4b8fbb92095b7d029')

prepare() {
    sed -i -e '/include/a \#include <wchar.h>' ${srcdir}/include/adl_structures.h
    sed -i -e '/include/a \#include <stdbool.h>' ${srcdir}/include/adl_sdk.h
}

build() {
    cd ${srcdir}/adlutil
    gcc main.c -o adlutil -DLINUX -ldl -I ../include/
}

package() {
    install -m755 -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/adlutil/adlutil ${pkgdir}/usr/bin

    install -m755 -d ${pkgdir}/usr/include/ADL
    install -m644 ${srcdir}/include/* ${pkgdir}/usr/include/ADL

    install -m755 -d ${pkgdir}/usr/share/doc/ADL
    mv -v ${srcdir}/Public-Documents ${srcdir}/Sample ${srcdir}/Sample-Managed ${srcdir}/ADL_SDK.html ${pkgdir}/usr/share/doc/ADL
}
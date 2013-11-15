# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight-git
_pkgname=pilight
pkgver=v2.0.r0.g172149f
pkgrel=1
pkgdesc="Send and receive 433.92Mhz codes"
arch=('i386' 'x86_64' 'arm')
url="http://pilight.org/"
license=('GPL3')
makedepends=('gcc' 'cmake' 'glibc')
source=(git+https://github.com/pilight/pilight.git)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    # sed -i '/CMAKE_C_FLAGS/s/mfloat-abi=hard/mfloat-abi=soft/' CMakeLists.txt
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default 
    # for f in $(grep -IRl "/local/" *)
    # do
    #     sed -i 's|/local||g' $f
    # done


    # Makefile.old
    mv Makefile.old Makefile
    for f in $(grep -IRl 'pilight.h"' .); do
        sed -i 's|\(#include .*pilight.h\)"|\1.in"|g' $f
    done
    sed -i 's/#cmakedefine/#define/g' pilight.h.in 
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr . 
}

package() {
    # TODO update libpilight.so path ! Now it points to $srcdir and not /usr/lib/pilight/libpilight.so
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir/" install
    cd "${pkgdir}"
    mkdir -p usr/share/webapps 
    mv usr/local/share/pilight usr/share/webapps
    # mv usr/local/bin/gpio usr/sbin
    rm -rf etc/init.d 
    mkdir -p etc/pilight
    install -Dm644 "${srcdir}/${_pkgname}/settings.json-default" etc/pilight/settings.json
    install -Dm755 "${srcdir}/${_pkgname}/libpilight.so" usr/lib/libpilight.so
}


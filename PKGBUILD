# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=2.0
pkgrel=1
pkgdesc="Send and receive 433.92Mhz codes"
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('git' 'gcc' 'glibc')
source=('https://github.com/pilight/pilight/archive/v2.0.tar.gz' 'https://raw.github.com/pschmitt/pilight/master/Makefile')
sha256sums=('113b879dd98a1a3fa07fb3c103cce36bdbc5454467af85a79e50c96f7dcb166c' 'SKIP')
conflicts=('pilight-git')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default 

    cp -f "${srcdir}/Makefile" Makefile                                                                 
    for f in $(grep -IRl 'pilight.h"' .); do
        sed -i 's|\(#include .*pilight.h\)"|\1.in"|g' $f
    done
    sed -i 's/#cmakedefine/#define/g' pilight.h.in 
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}


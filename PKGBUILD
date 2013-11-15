# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=2.0
pkgrel=2
pkgdesc="Send and receive 433.92Mhz codes"
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('git' 'gcc' 'glibc')
source=('https://github.com/pilight/pilight/archive/v2.0.tar.gz' 
        'https://raw.github.com/pschmitt/pilight/master/Makefile' 
        'https://raw.github.com/pschmitt/pilight/master/pilight.service')
sha256sums=('113b879dd98a1a3fa07fb3c103cce36bdbc5454467af85a79e50c96f7dcb166c' 
            '8669f4366b60f9ff6e17cbab219654a3c81e4e5f0a0e8e79779e3a3297fae760'
            '826f51966a2fbaf00ea8b3900010142f6974420e475874a314ad5466811a6bd9')
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
    install -Dm644 "${srcdir}/pilight.service" "${pkgdir}/usr/lib/systemd/system/pilight.service"
}


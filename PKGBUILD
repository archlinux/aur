# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=2.0
pkgrel=5
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('git' 'gcc' 'glibc')
source=('https://github.com/pilight/pilight/archive/v2.0.tar.gz' 
        'https://raw.github.com/pschmitt/aur-pilight/master/Makefile' 
        'https://raw.github.com/pschmitt/aur-pilight/master/pilight.service')
sha256sums=('113b879dd98a1a3fa07fb3c103cce36bdbc5454467af85a79e50c96f7dcb166c' 
            '8669f4366b60f9ff6e17cbab219654a3c81e4e5f0a0e8e79779e3a3297fae760'
            'a6646c4ccb653d17b6b77a3659d96e5d37becd3a0c0daedce48773094ad81e40')
conflicts=('pilight-git')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default 

    cp -f "${srcdir}/Makefile" Makefile                                                                 
    for f in $(grep -IRl 'pilight.h"' .); do
        sed -i 's|\(#include .*pilight.h\)"|\1.in"|g' $f
    done
    sed -i 's/#cmakedefine/#define/g;/#define DEBUG/d' pilight.h.in
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


# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=6.0
pkgrel=1
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h' 'armv7h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('cmake' 'gcc' 'glibc')
# TODO Are libpcap and libunwind not just build dependencies?
depends=('libpcap' 'libunwind')
source=("https://github.com/pilight/pilight/archive/v${pkgver}.tar.gz"
        'https://raw.github.com/pschmitt/aur-pilight/master/pilight.service')
sha256sums=('74a2f70ee1a7d0593666e5adc3c830ff2fc4bcd4c4d19a9cabbc4310d0549ec8'
            '0d49982c52805a8004db3c32003b961731eb94af81d003b49c24cdb84607e588')
conflicts=('pilight-git')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Don't execute ldconfig when running make (requires root)
    sed -i 's/\(^.*COMMAND ldconfig.*\)/# \1/g' CMakeLists.txt
    # Change default webserver location
    sed -i 's|\("webserver-root"\): .*|\1: "/usr/share/webapps/pilight",|' config.json-default
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir/" install
    install -Dm644 "${srcdir}/pilight.service" "${pkgdir}/usr/lib/systemd/system/pilight.service"

    # Fix paths
    cd "${pkgdir}"
    mv usr/sbin/* usr/bin
    rmdir usr/sbin
    mv usr/lib/pilight/libpilight.so.${pkgver} usr/lib/libpilight.so.${pkgver}
    ln -s usr/lib/libpilight.so.${pkgver} usr/lib/libpilight.so
    mkdir -p usr/share/webapps/${pkgname}
    mv usr/local/share/${pkgname}/default usr/share/webapps/${pkgname}

    # Cleanup
    rm -rf usr/local usr/lib/pilight etc/init.d
}

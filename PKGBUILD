# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=3.0
pkgrel=1
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('git' 'gcc' 'glibc')
source=("https://github.com/pilight/pilight/archive/v${pkgver}.tar.gz"
        'https://raw.github.com/pschmitt/aur-pilight/master/pilight.service')
sha256sums=('7cdd313e0b234c694b617f1a672abf8ad588ded00c4e130378b7285999b1d18e'
            'a6646c4ccb653d17b6b77a3659d96e5d37becd3a0c0daedce48773094ad81e40')
conflicts=('pilight-git')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Fix zlib path
    sed -i 's|\(/usr/lib/\).*/\(libz.so\)|\1\2|g' CMakeLists.txt
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir/" install
    install -Dm644 "${srcdir}/pilight.service" "${pkgdir}/usr/lib/systemd/system/pilight.service"

    # Fix paths
    cd "${pkgdir}"
    mv usr/sbin usr/bin
    mv usr/lib/pilight/libpilight.so.2 usr/lib/libpilight.so.2
    ln -s usr/lib/libpilight.so.2 usr/lib/libpilight.so
    mkdir -p usr/share/webapps/${pkgname}
    mv usr/local/share/${pkgname}/default usr/share/webapps/${pkgname}

    # Cleanup
    rm -rf usr/local usr/lib/pilight etc/init.d
}


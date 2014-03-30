# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=3.0
_pkgver_major=$(sed -n 's/\(^[0-9]\+\)\.*.*$/\1/p' <<< $pkgver)
pkgrel=4
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('cmake' 'git' 'gcc' 'glibc')
source=("https://github.com/pilight/pilight/archive/v${pkgver}.tar.gz"
        'https://raw.github.com/pschmitt/aur-pilight/master/pilight.service')
sha256sums=('fdd75bccdb4df1e75749ba6b1b490d5e258a752e85efd5f63ea35130a1de94f1'
            '25ffe32693a9a68be4234f63248f6e72e1704cbb74646f77672d02ba19e7f179')
conflicts=('pilight-git')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Fix zlib path
    sed -i 's|\(/usr/lib/\).*/\(libz.so\)|\1\2|g' CMakeLists.txt
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default
    sed -i 's|\("pid-file"\): "/var\(/run/pilight.pid\)"|\1: "\2"|' settings.json-default
    # Dirty fix for hardcoded interface name (try to guess default network interface name)
    local default_net_interface=$(route | grep default | tail -1 | awk '{ print $NF }')
    sed -i "s/eth0/${default_net_interface}/g" libs/pilight/ssdp.c
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
    mv usr/lib/pilight/libpilight.so.${_pkgver_major} usr/lib/libpilight.so.${_pkgver_major}
    ln -s usr/lib/libpilight.so.${_pkgver_major} usr/lib/libpilight.so
    mkdir -p usr/share/webapps/${pkgname}
    mv usr/local/share/${pkgname}/default usr/share/webapps/${pkgname}

    # Cleanup
    rm -rf usr/local usr/lib/pilight etc/init.d
}


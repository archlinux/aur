# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight-git
_pkgname=pilight
pkgver=v3.0.r163.geccaab8
_pkgver_major=$(sed -n 's/^v\([0-9]\+\)\.*.*$/\1/p' <<< $pkgver)
pkgrel=3
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('git' 'gcc' 'glibc')
source=('git+https://github.com/pilight/pilight.git#branch=development'
        'https://raw.github.com/pschmitt/aur-pilight-git/master/pilight.service')
sha256sums=('SKIP'
            '25ffe32693a9a68be4234f63248f6e72e1704cbb74646f77672d02ba19e7f179')
conflicts=('pilight')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # Why is the last tag skipped?
    local latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
    local description=$(git describe | sed 's/^v.*-\(.*-.*\)$/\1/')
    sed -E 's/([^-]*-g)/r\1/;s/-/./g' <<< "${latest_tag}-${description}"
    # git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    # Fix zlib path
    sed -i 's|\(/usr/lib/\).*/\(libz.so\)|\1\2|g' CMakeLists.txt
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default
    sed -i 's|\("pid-file"\): "/var\(/run/pilight.pid\)"|\1: "\2"|' settings.json-default
    # Dirty fix for hardcoded interface name (try to guess default network interface name)
    local default_net_interface=$(route | grep default | tail -1 | awk '{ print $NF }')
    sed -i "s/eth0/${default_net_interface}/g" libs/pilight/ssdp.c
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="$pkgdir/" install
    install -Dm644 "${srcdir}/pilight.service" "${pkgdir}/usr/lib/systemd/system/pilight.service"

    # Fix paths
    cd "${pkgdir}"
    mv usr/sbin usr/bin
    mv usr/lib/pilight/libpilight.so.${_pkgver_major} usr/lib/libpilight.so.${_pkgver_major}
    ln -s usr/lib/libpilight.so.${_pkgver_major} usr/lib/libpilight.so
    mkdir -p usr/share/webapps/${_pkgname}
    mv usr/local/share/${_pkgname}/default usr/share/webapps/${_pkgname}

    # Cleanup
    rm -rf usr/local usr/lib/pilight etc/init.d
}


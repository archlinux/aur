# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight-git
_pkgname=pilight
pkgver=v3.0.r2.gf1fecb7
pkgrel=1
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('git' 'gcc' 'glibc')
source=('git+https://github.com/pilight/pilight.git#branch=development'
        'https://raw.github.com/pschmitt/aur-pilight-git/master/pilight.service')
sha256sums=('SKIP'
            'a6646c4ccb653d17b6b77a3659d96e5d37becd3a0c0daedce48773094ad81e40')
conflicts=('pilight')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    # Fix zlib path
    sed -i 's|\(/usr/lib/\).*/\(libz.so\)|\1\2|g' CMakeLists.txt
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default
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
    mv usr/lib/pilight/libpilight.so.2 usr/lib/libpilight.so.2
    ln -s usr/lib/libpilight.so.2 usr/lib/libpilight.so
    mkdir -p usr/share/webapps/${_pkgname}
    mv usr/local/share/${_pkgname}/default usr/share/webapps/${_pkgname}

    # Cleanup
    rm -rf usr/local usr/lib/pilight etc/init.d
}


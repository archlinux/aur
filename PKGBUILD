# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pilight
pkgver=5.0
pkgrel=2
pkgdesc='Modular domotica with the Raspberry Pi'
arch=('x86_64' 'armv6h')
url="http://pilight.org/"
license=('GPL3')
makedepends=('cmake' 'git' 'gcc' 'glibc')
source=("https://github.com/pilight/pilight/archive/v${pkgver}.tar.gz"
        'https://raw.github.com/pschmitt/aur-pilight/master/pilight.service')
sha256sums=('386d4fb064d0035739c3941df1bb760962ba09cda8594ec70df78342cbb018a9'
            '25ffe32693a9a68be4234f63248f6e72e1704cbb74646f77672d02ba19e7f179')
conflicts=('pilight-git')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Don't execute ldconfig when running make (requires root)
    sed -i 's/\(^.*COMMAND ldconfig.*\)/# \1/g' CMakeLists.txt
    # Change default webserver location
    sed -i 's|\("webserver-root"\): "/usr/local/share/pilight/"|\1: "/usr/share/webapps/pilight"|' settings.json-default
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
    mv usr/lib/pilight/libpilight.so.${pkgver} usr/lib/libpilight.so.${pkgver}
    ln -s usr/lib/libpilight.so.${pkgver} usr/lib/libpilight.so
    mkdir -p usr/share/webapps/${pkgname}
    mv usr/local/share/${pkgname}/default usr/share/webapps/${pkgname}

    # Cleanup
    rm -rf usr/local usr/lib/pilight etc/init.d
}


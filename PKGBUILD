# Maintainer: Joe George <joe at externl dot com>
# Contributor: Daniel Spies <ds20150201aur at pskx dot net>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=(
    "zeroc-ice"
    "zeroc-ice-php"
    "zeroc-ice-java"
)

pkgbase=("zeroc-ice")
pkgver=3.6.0
pkgrel=1
pkgdesc="An object-oriented middleware that provides object-oriented Remote Procedure Call functionality"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "mcpp>=2.7.2"
    "php" "bzip2"
    "java-environment"
    "java-berkeleydb>=5.3"
)

depends=("mcpp>=2.7.2")
_depends_zeroc_ice_php=("zeroc-ice" "php")
_depends_zeroc_ice_java=("zeroc-ice" "java-environment")

source=(
    "ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz"
    "ice-packaging-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice-packaging/archive/v${pkgver}.tar.gz"
)

sha256sums=('77933580cdc7fade0ebfce517935819e9eef5fc6b9e3f4143b07404daf54e25e'
            'f995dbd8ec64d301c3abcf8697b243e1b8b051c799d17acc82a4a2c681834a34')
install=ice.install

_make_args="OPTIMIZE=yes embedded_runpath=prefix='' prefix=/usr"
_gradle_args="--gradle-user-home=/tmp/zeroc-ice-java --no-daemon -PdbHome=/usr/share/java/berkeleydb"

build() {
    cd ${srcdir}/ice-${pkgver}/cpp/src

    msg "Building Ice for C++"
    msg2 "Compiling..."
    make ${_make_args} -j`nproc`

    cd ${srcdir}/ice-${pkgver}/php
    msg "Building Ice for PHP"
    msg2 "Compiling..."
    make ${_make_args} DESTDIR="${pkgdir}/"

    cd ${srcdir}/ice-${pkgver}/java
    msg "Building Ice for Java"
    msg2 "Compiling..."
    ./gradlew ${_gradle_args} -Pprefix=${pkgdir}/usr/share/java/zeroc-ice assemble
}

package_zeroc-ice() {
    backup=(
        "etc/glacier2router.conf"
        "etc/icegridnode.conf"
        "etc/icegridregistry.conf"
    )

    cd ${srcdir}/ice-${pkgver}/cpp

    msg "Installing Ice for C++"
    make DESTDIR="${pkgdir}/" ${_make_args} install

    msg2 "Installing Ice License..."
    install -Dm644 ${srcdir}/ice-${pkgver}/ICE_LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    if [ $CARCH = "x86_64" ]; then
        # NOTE: ${pkgdir}/usr/lib/ should already be empty
        #       for x86_64 otherwise something has gone wrong
        rm -df ${pkgdir}/usr/lib/
        mv ${pkgdir}/usr/lib64/ ${pkgdir}/usr/lib/
    fi

    msg2 "Installing systemd services..."
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/rpm/glacier2router.conf ${pkgdir}/etc/glacier2router.conf
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/rpm/icegridnode.conf ${pkgdir}/etc/icegridnode.conf
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/rpm/icegridregistry.conf ${pkgdir}/etc/icegridregistry.conf

    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/rpm/glacier2router.service \
                   ${pkgdir}/usr/lib/systemd/system/glacier2router.service
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/rpm/icegridnode.service \
                   ${pkgdir}/usr/lib/systemd/system/icegridnode.service
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/rpm/icegridregistry.service \
                   ${pkgdir}/usr/lib/systemd/system/icegridregistry.service

    rm -f ${pkgdir}/usr/share/Ice-${pkgver}/LICENSE
    rm -f ${pkgdir}/usr/share/Ice-${pkgver}/ICE_LICENSE
}

package_zeroc-ice-php() {
   depends=("${_depends_zeroc_ice_php[@]}")

    cd ${srcdir}/ice-${pkgver}/php
    make ${_make_args} DESTDIR="${pkgdir}/" install

    msg "Installing Ice for PHP"
    install -dm755 ${pkgdir}/etc/php/conf.d/
    echo "extension = IcePHP.so" > ${pkgdir}/etc/php/conf.d/ice.ini
    echo "include_path=${include_path}:/usr/share/Ice-${pkgver}/php/" > ${pkgdir}/etc/php/conf.d/ice.ini

    # Put stuff into more possibly Arch Linux friendly places
    rm -rf ${pkgdir}/usr/share/Ice-${pkgver}/*
    rm ${pkgdir}/usr/share/slice
    mv ${pkgdir}/usr/share/php ${pkgdir}/usr/share/Ice-${pkgver}/php
}

package_zeroc-ice-java() {
    depends=("${_depends_zeroc_ice_java[@]}")
    arch=("any")

    cd ${srcdir}/ice-${pkgver}/java

    msg "Installing Ice for Java"

    ./gradlew ${_gradle_args} -Pprefix=${pkgdir}/usr/share/java/zeroc-ice install

    mv ${pkgdir}/usr/share/java/zeroc-ice/lib/* ${pkgdir}/usr/share/java/zeroc-ice/
    rmdir ${pkgdir}/usr/share/java/zeroc-ice/lib
}

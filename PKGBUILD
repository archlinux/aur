# Maintainer: Joe George <joe at externl dot com>
# Contributor: Daniel Spies <ds20150201aur at pskx dot net>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=(
    "zeroc-ice"
    "zeroc-ice-java"
)

pkgbase=("zeroc-ice")
pkgver=3.6.2
pkgrel=2
pkgdesc="An object-oriented middleware that provides object-oriented Remote Procedure Call functionality"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "mcpp>=2.7.2"
    "bzip2"
    "java-environment"
    "java-berkeleydb>=5.3"
)

depends=("mcpp>=2.7.2")
_depends_zeroc_ice_java=("zeroc-ice" "java-environment")

source=(
    "ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz"
    "ice-packaging-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice-packaging/archive/v${pkgver}.tar.gz"
)

sha256sums=('5e9305a5eb6081c8f128d63a5546158594e9f115174fc91208f645dbe2fc02fe'
            'f838d1740ef9421151873f1e04c9afd89da7c73998991f73f7c66e8466f5de80')
install=ice.install

_make_args="OPTIMIZE=yes embedded_runpath=prefix='' prefix=/usr"
_gradle_args="--gradle-user-home=/tmp/zeroc-ice-java --no-daemon -PdbHome=/usr/share/java/berkeleydb"

build() {
    cd ${srcdir}/ice-${pkgver}/cpp/src

    msg "Building Ice for C++"
    msg2 "Compiling..."
    make ${_make_args} -j`nproc`

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
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/glacier2router.conf ${pkgdir}/etc/glacier2router.conf
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/icegridnode.conf ${pkgdir}/etc/icegridnode.conf
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/icegridregistry.conf ${pkgdir}/etc/icegridregistry.conf

    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/common/systemd/glacier2router.service \
                   ${pkgdir}/usr/lib/systemd/system/glacier2router.service
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/common/systemd/icegridnode.service \
                   ${pkgdir}/usr/lib/systemd/system/icegridnode.service
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/common/systemd/icegridregistry.service \
                   ${pkgdir}/usr/lib/systemd/system/icegridregistry.service

    rm -f ${pkgdir}/usr/share/Ice-${pkgver}/LICENSE
    rm -f ${pkgdir}/usr/share/Ice-${pkgver}/ICE_LICENSE
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

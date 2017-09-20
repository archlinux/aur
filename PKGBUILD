# Maintainer: Joe George <joe at externl dot com>
# Contributor: Daniel Spies <ds20150201aur at pskx dot net>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=(
    "zeroc-ice"
    "zeroc-ice-java"
)

pkgbase=("zeroc-ice")
pkgver=3.7.0
pkgrel=1
pkgdesc="An object-oriented middleware that provides object-oriented Remote Procedure Call functionality"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:Ice license")
makedepends=(
    "mcpp>=2.7.2"
    "bzip2"
    "java-environment"
    "lmdb"
)

depends=("mcpp>=2.7.2")
depends_zeroc_ice_java=("zeroc-ice" "java-environment")

source=(
    "ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz"
    "ice-packaging-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice-packaging/archive/v${pkgver}.tar.gz"
)

sha256sums=('809fff14a88a7de1364c846cec771d0d12c72572914e6cc4fb0b2c1861c4a1ee'
            '096bcfb74b9a281ad9bccf3eaa360b912cb96e88735d5b18b96198f657b323cb')

install=ice.install

make_args=(
    "OPTIMIZE=yes"
    "USR_DIR_INSTALL=yes"
    "prefix=/usr"
    "CONFIGS=shared cpp11-shared"
    "SKIP=slice2py"
)

gradle_args=(
    "--gradle-user-home=/tmp/zeroc-ice-java"
    "--no-daemon"
    "-PdbHome=/usr/share/java/berkeleydb"
)

build() {
    cd ${srcdir}/ice-${pkgver}
    msg "Building Ice"
    msg2 "Compiling..."
    make srcs -j$(nproc) "${make_args[@]}" "LANGUAGES=cpp java"
}

package_zeroc-ice() {
    backup=(
        "etc/glacier2router.conf"
        "etc/icegridnode.conf"
        "etc/icegridregistry.conf"
    )

    cd ${srcdir}/ice-${pkgver}

    msg "Installing Ice for C++"
    make install "${make_args[@]}" DESTDIR="${pkgdir}" "LANGUAGES=cpp"

    msg2 "Installing Ice License..."
    install -Dm644 ${srcdir}/ice-${pkgver}/ICE_LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/Ice-${pkgver}/LICENSE
    rm -f ${pkgdir}/usr/share/Ice-${pkgver}/ICE_LICENSE

    if [ $CARCH = "x86_64" ]; then
        # NOTE: ${pkgdir}/usr/lib/ should already be empty
        #       for x86_64 otherwise something has gone wrong
        rm -df ${pkgdir}/usr/lib/
        msg2 "Renaming lib64 -> lib"
        mv ${pkgdir}/usr/lib64/ ${pkgdir}/usr/lib/
    fi

    msg2 "Installing systemd services..."
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/glacier2router.conf ${pkgdir}/etc/glacier2router.conf
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/icegridnode.conf ${pkgdir}/etc/icegridnode.conf
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/icegridregistry.conf ${pkgdir}/etc/icegridregistry.conf

    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/glacier2router.service \
                   ${pkgdir}/usr/lib/systemd/system/glacier2router.service
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/icegridnode.service \
                   ${pkgdir}/usr/lib/systemd/system/icegridnode.service
    install -Dm644 ${srcdir}/ice-packaging-${pkgver}/ice/rpm/icegridregistry.service \
                   ${pkgdir}/usr/lib/systemd/system/icegridregistry.service
}

package_zeroc-ice-java() {
    depends=("${depends_zeroc_ice_java[@]}")
    arch=("any")

    msg "Installing Ice for Java"

    for d in ${srcdir}/ice-${pkgver}/java ${srcdir}/ice-${pkgver}/java-compat; do
        cd $d
        ./gradlew "${gradle_args[@]}" -Pprefix=${pkgdir}/usr/share/java/zeroc-ice install
    done

    mv ${pkgdir}/usr/share/java/zeroc-ice/lib/* ${pkgdir}/usr/share/java/zeroc-ice/
    rmdir ${pkgdir}/usr/share/java/zeroc-ice/lib
}

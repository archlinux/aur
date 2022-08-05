# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=mekhq
pkgver=0.48.0
_pkgver=
pkgrel=6
epoch=
install=mekhq.install
pkgdesc="MekHQ is a java helper program for the MegaMek game that allows users to load a list of entities from an XML file, perform repairs and customizations, and then save the new entities to another XML file that can be loaded into MegaMek."

arch=('x86_64')
url="https://github.com/MegaMek/mekhq"
license=('GPL')
groups=()
depends=('jdk11-openjdk' 'rsync')
makedepends=('gradle' 'git')
provides=('megamek')
conflicts=('megamek')

source=("mekhq.tar.gz::https://github.com/MegaMek/mekhq/archive/refs/tags/v${pkgver}.tar.gz"
        "megamek.tar.gz::https://github.com/MegaMek/megamek/archive/refs/tags/v${pkgver}.tar.gz"
        "megameklab.tar.gz::https://github.com/MegaMek/megameklab/archive/refs/tags/v${pkgver}.tar.gz"
        "mekhq.install"
        "mekhq.desktop"
        "megamek.desktop"
        "megameklab.desktop"
        "mekhq.sh")

sha256sums=('69bee526358f576453b51fae8ef2c3aa83f09c044d032f6c587c4fe267b9d2ba'
            '4942182c885b87caa9e851d1851add095f2e2103c0933b61e961f6e74d3e1b29'
            'e7b0e37d98cd8273d7e23ce655773c37482980f4d2a95d739e1f8af025e0989f'
            '2432d81323849cf60d801782e60a842ceef70ed5a2ed7b56a012f3a8391c49ce'
            'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            '6e6bb03f14a0ce6e06fd9009fd9f159d22a34a7020ba85b13ad6dbf649ca9e38'
            '977b1292555b1a8f82636f292460b06c6c12c0dd06c3e20a23fbc4cf4fc7452d')

build() {
    rm -rf megamek megameklab
    
    mv megamek-${pkgver} megamek
    mv megameklab-${pkgver} megameklab
    
    cd ${pkgname}-${pkgver}
    ./gradlew stageFiles
    ./gradlew stageMM
    ./gradlew stageMML
    ./gradlew startScripts
    ./gradlew installUnixDist
}

package() {


    install -D "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/MegaMek.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMek.jar"

    install -D "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/MegaMekLab.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMekLab.jar"

    install -D "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/MekHQ.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MekHQ.jar"

    install -Dm755 "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/mm-startup" \
            "${pkgdir}/usr/lib/${pkgname}/mm-startup"
    install -Dm755 "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/hq" \
            "${pkgdir}/usr/lib/${pkgname}/hq"
    install -Dm755 "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/lab" \
            "${pkgdir}/usr/lib/${pkgname}/lab"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/campaigns" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/data" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/docs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/lib" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/logs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/${pkgname}/mmconf" "${pkgdir}/usr/lib/${pkgname}"

    
    install -D mekhq.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D megamek.desktop "${pkgdir}/usr/share/applications/megamek.desktop"
    install -D megameklab.desktop "${pkgdir}/usr/share/applications/megameklab.desktop"
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/megamek"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/megameklab"

}

# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=mekhq
pkgver=0.48.0
_pkgver=
pkgrel=2
epoch=
pkgdesc="MekHQ is a java helper program for the MegaMek game that allows users to load a list of entities from an XML file, perform repairs and customizations, and then save the new entities to another XML file that can be loaded into MegaMek."

arch=('x86_64')
url="https://github.com/MegaMek/mekhq"
license=('GPL')
groups=()
depends=('jdk11-openjdk')
makedepends=('gradle' 'git')
provides=('megamek')
conflicts=('megamek')

source=("mekhq.tar.gz::https://github.com/MegaMek/mekhq/archive/refs/tags/v${pkgver}.tar.gz"
        "megamek.tar.gz::https://github.com/MegaMek/megamek/archive/refs/tags/v${pkgver}.tar.gz"
        "megameklab.tar.gz::https://github.com/MegaMek/megameklab/archive/refs/tags/v${pkgver}.tar.gz"
        "mekhq.desktop"
        "megamek.desktop"
        "mekhq.sh"
        "megamek.sh")

sha256sums=('69bee526358f576453b51fae8ef2c3aa83f09c044d032f6c587c4fe267b9d2ba'
            '4942182c885b87caa9e851d1851add095f2e2103c0933b61e961f6e74d3e1b29'
            'e7b0e37d98cd8273d7e23ce655773c37482980f4d2a95d739e1f8af025e0989f'
            'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            'fda6e9d542062041e9d9b7f6331069d8a78b9455a290286aa8d214ed66b13fd7'
            '9ad4d0251ecfe02140c46dfeb67a4ce2b0fe9f123b04a3911139b8e255ff2beb')

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
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 megamek.sh "${pkgdir}/usr/bin/megamek"

}

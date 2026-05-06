# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=mekhq
pkgver=0.50.12
_pkgver_mmdata=0.3.1
pkgrel=1
epoch=
install=mekhq.install
pkgdesc="MekHQ is a java helper program for the MegaMek game that allows users to load a list of entities from an XML file, perform repairs and customizations, and then save the new entities to another XML file that can be loaded into MegaMek."

arch=('x86_64')
url="https://github.com/MegaMek/mekhq"
license=('GPL')
groups=()
depends=('jdk17-openjdk' 'rsync')
makedepends=('gradle' 'git')
provides=('megamek')
conflicts=('megamek')

source=("mekhq.tar.gz::https://github.com/MegaMek/mekhq/archive/refs/tags/v${pkgver}.tar.gz"
        "megamek.tar.gz::https://github.com/MegaMek/megamek/archive/refs/tags/v${pkgver}.tar.gz"
        "megameklab.tar.gz::https://github.com/MegaMek/megameklab/archive/refs/tags/v${pkgver}.tar.gz"
        "mm-data.tar.gz::https://github.com/MegaMek/mm-data/archive/refs/tags/v${_pkgver_mmdata}.tar.gz"
        "mekhq.install"
        "mekhq.desktop"
        "megamek.desktop"
        "megameklab.desktop"
        "mekhq.sh")

sha256sums=('f6751ceed09ac42c9d5dfd5e95712542c99c62207422f5f9342c1630f1b0a81d'
            'f743fcae79dc5bf9914499ef4ef50889310b661867c4d130e1929a8ea2a3df7f'
            '886173b14ba2a9a9c2983ab6970e37a8379a312e4eaa69954b7cc81f4e47296e'
            'aeb77027845c3d96b95c7598d5dc9e8dd63c543c80248496dc4a52fc3e48fef3'
            '2432d81323849cf60d801782e60a842ceef70ed5a2ed7b56a012f3a8391c49ce'
            'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            '6e6bb03f14a0ce6e06fd9009fd9f159d22a34a7020ba85b13ad6dbf649ca9e38'
            '4025c2a47440102cbf13c8d81f584db7cd6acd1aff8974f48bddbd38c525e1c1')

build() {
    rm -rf megamek megameklab mm-data
    
    mv megamek-${pkgver} megamek
    mv megameklab-${pkgver} megameklab
    mv mm-data-${_pkgver_mmdata} mm-data

    # patch a file for this version
    sed -i 's/patch=13.*/patch=12/g' megamek/megamek/resources/Version.properties
    sed -i '94i \ \ \ \ dependsOn("ratZip")' mm-data/build.gradle.kts
    
    cd ${pkgname}-${pkgver}
    ./gradlew buildAllPackages
    ./gradlew installDist
}

package() {


    install -D "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/MegaMek.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMek.jar"

    install -D "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/MegaMekLab.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMekLab.jar"

    install -D "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/MekHQ.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MekHQ.jar"

    install -Dm755 "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/bin/MegaMek" \
            "${pkgdir}/usr/lib/${pkgname}/bin/MegaMek"
    install -Dm755 "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/bin/MekHQ" \
            "${pkgdir}/usr/lib/${pkgname}/bin/MekHQ"
    install -Dm755 "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/bin/MegaMekLab" \
            "${pkgdir}/usr/lib/${pkgname}/bin/MegaMekLab"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/campaigns" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/data" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/docs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/lib" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/logs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/mmconf" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}/MekHQ/build/install/MekHQ/userdata" "${pkgdir}/usr/lib/${pkgname}"

    
    install -D mekhq.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D megamek.desktop "${pkgdir}/usr/share/applications/megamek.desktop"
    install -D megameklab.desktop "${pkgdir}/usr/share/applications/megameklab.desktop"
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/megamek"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/megameklab"

}

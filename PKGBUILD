# Maintainer: algebro <algebro at tuta dot io>
# Based on the mekhq AUR package by: Paul Davis <paul@dangersalad.com>

pkgname=mekhq-git
_pkgname=mekhq
pkgver=0.49.2.r75.g89903d36e
pkgrel=1
epoch=
pkgdesc="MekHQ is a java helper program for the MegaMek game that allows users to load a list of entities from an XML file, perform repairs and customizations, and then save the new entities to another XML file that can be loaded into MegaMek."
arch=('x86_64')
url="https://github.com/MegaMek/mekhq"
license=('GPL')
groups=()
depends=('jdk11-openjdk')
makedepends=('gradle' 'git')
provides=('megamek' 'mekhq')
conflicts=('megamek' 'mekhq')

source=("git+https://github.com/MegaMek/mekhq.git"
        "git+https://github.com/MegaMek/megamek.git"
        "git+https://github.com/MegaMek/megameklab.git"
        "mekhq.desktop"
        "megamek.desktop"
        "mekhq.sh"
        "megamek.sh")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            'fda6e9d542062041e9d9b7f6331069d8a78b9455a290286aa8d214ed66b13fd7'
            '9ad4d0251ecfe02140c46dfeb67a4ce2b0fe9f123b04a3911139b8e255ff2beb')

pkgver() {
    cd mekhq
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd mekhq
    ./gradlew stageFiles
    ./gradlew stageMM
    ./gradlew stageMML
    ./gradlew startScripts
    ./gradlew installUnixDist
}

package() {

    install -D "${_pkgname}/MekHQ/build/install/${_pkgname}/MegaMek.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MegaMek.jar"

    install -D "${_pkgname}/MekHQ/build/install/${_pkgname}/MegaMekLab.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MegaMekLab.jar"

    install -D "${_pkgname}/MekHQ/build/install/${_pkgname}/MekHQ.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MekHQ.jar"

    install -Dm755 "${_pkgname}/MekHQ/build/install/${_pkgname}/mm-startup" \
            "${pkgdir}/usr/lib/${_pkgname}/mm-startup"
    install -Dm755 "${_pkgname}/MekHQ/build/install/${_pkgname}/hq" \
            "${pkgdir}/usr/lib/${_pkgname}/hq"
    install -Dm755 "${_pkgname}/MekHQ/build/install/${_pkgname}/lab" \
            "${pkgdir}/usr/lib/${_pkgname}/lab"

    cp -r "${_pkgname}/MekHQ/build/install/${_pkgname}/campaigns" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}/MekHQ/build/install/${_pkgname}/data" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}/MekHQ/build/install/${_pkgname}/docs" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}/MekHQ/build/install/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}/MekHQ/build/install/${_pkgname}/logs" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}/MekHQ/build/install/${_pkgname}/mmconf" "${pkgdir}/usr/lib/${_pkgname}"

    
    install -D mekhq.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -D megamek.desktop "${pkgdir}/usr/share/applications/megamek.desktop"
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 megamek.sh "${pkgdir}/usr/bin/megamek"

}

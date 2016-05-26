# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: adagari <adam.garibay at gmail dot com>

pkgname=ut4
pkgver=2984440
pkgrel=1
pkgdesc="Pre-Alpha of the new Unreal Tournament based on Unreal Engine 4."
arch=("x86_64")
url="https://www.epicgames.com/unrealtournament/"
license=('custom')
makedepends=('unzip')
DLAGENTS+=("file::/usr/bin/echo Could not find %u. Manually download it to the build directory, from https://forums.unrealtournament.com/showthread.php?12011-Unreal-Tournament-Pre-Alpha-Playable-Build. Registration required.")
source=(file://"UnrealTournament-Client-XAN-${pkgver}-Linux.zip"
        "UnrealTournament"
        "UnrealTournament4.desktop")
noextract=("UnrealTournament-Client-XAN-${pkgver}-Linux.zip")
sha512sums=(
    'e7c8110dbbf56ca52848133f4d8960fe72f66de44409257efbea9311cdd959040b2cf299fd9d5ebcae42a0448a2d174345cf78a6f469c31b7a61ac43197e7103'
    'f0e737f9d331e938b5b3433e8e182792339e5ec804923e78beed813e472ab24a45db25c01227e42256dece7170e967f6a87795c3d4591ebcfaa876cee12249b8'
    '0d0d92628c98113b4fd7ae2ce496fd679e90b115f701979edd99e9cb89826fd647cac15402ba3467755b96173330c7b47505d32798f926803bcf1beaf73f6942'
)

prepare() {
    cd ${srcdir}
    unzip UnrealTournament-Client-XAN-${pkgver}-Linux.zip
}

package() {
    DEST="/opt"
    RPATH="${pkgdir}${DEST}"
    DPATH="${RPATH}/ut4"
    install -d "${RPATH}"
    cp -ra LinuxNoEditor "${DPATH}"

    chgrp -R games "${DPATH}"
    chmod -R a+rw "${DPATH}/UnrealTournament/Saved"

    chmod +x "${DPATH}/Engine/Binaries/Linux/UE4-Linux-Shipping"
    chmod +x "${DPATH}/Engine/Binaries/Linux/UE4-Linux-Test"

    BPATH="${pkgdir}/usr/bin"
    install -d "${BPATH}"
    install UnrealTournament "${BPATH}"
    chmod +x "${BPATH}/UnrealTournament"

    install -d "${pkgdir}/usr/share/applications/"
    sed -i "s@PATH@${DEST}@g" UnrealTournament4.desktop
    install UnrealTournament4.desktop "${pkgdir}/usr/share/applications/"
}

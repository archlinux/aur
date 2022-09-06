# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=altirra
pkgver=4.01
pkgrel=5
pkgdesc="An 8-bit Atari computer emulator, on Wine"
arch=('any')
url="https://www.virtualdub.org/altirra.html"
license=('GPL2')
depends=('wine'
         'wine-mono')
optdepends=('wine-gecko: HTML help pages support')
provides=('altirra')
source=("https://www.virtualdub.org/downloads/Altirra-$pkgver.zip"
        "http://www.emulators.com/freefile/pcxf380.zip"
        "https://atariage.com/5200/roms/5200.zip"
        "altirra"
        "altirra.desktop"
        "altirra.png"
        "application-altirra.xml"
        "firmware-setup.reg")
noextract=('pcxf380.zip'
           '5200.zip')
sha256sums=('ac43fef674882d99b6461868f90671bb726c3cc9dd8059f38f19813f4ffba6cf'
            '2c0cf7e30ae8a486fc03903de4ebb1d7a40f0d9db3bfcb5dd4861e0cf5da67a5'
            '20f220c18c0e1d649203c43743915cec76cb697ce113e8b06626eef64053ecc5'
            'a83b433a36c398eab7cb80b38d7e9f6ca42a5f8e029423e1adc6b0fae181f3ca'
            '713b375c8467da838f4c4c9f1eca2a947aecc6c429161bc67eeedecc7c81b620'
            '5319fd88751fa886683d955976ed74eb266e9ea462ae77431b6a6c457ce42dc1'
            'cd3a40e290d999912767a70ffc8e4185019290251b350f887f4a2fa972b6c96b'
            '656259516f099cfe23265217713dccce70bc437dffa2819cd0c9626d8e2d8b2f')

prepare() {
    bsdtar -xvf pcxf380.zip ATARIBAS.ROM ATARIOSB.ROM ATARIXL.ROM
    bsdtar -xvf 5200.zip
    mv 5200.rom 5200.ROM
}

package() {
    dest="${pkgdir}"/opt/${pkgname}
    # windows program files
    install -Dm644 -t "${dest}"/ Additions.atr Altirra.chm Altirra64.exe firmware-setup.reg
    # shell script
    install -m755 altirra "${dest}"/altirra
    # firmware roms
    install -Dm644 -t "${dest}"/roms/ 5200.ROM ATARIBAS.ROM ATARIOSB.ROM ATARIXL.ROM
    # desktop entry
    share="${pkgdir}"/usr/share
    install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
    install -Dm644 ${pkgname}.png "${share}"/pixmaps/${pkgname}.png
    install -Dm644 application-${pkgname}.xml "${share}"/mime/packages/application-${pkgname}.xml
    # PATH symlink
    install -dm755 "${pkgdir}"/usr/bin/
    ln -s /opt/${pkgname}/altirra "${pkgdir}"/usr/bin/altirra
}

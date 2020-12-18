# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-software-and-documentation
pkgver=6.92
pkgrel=2
epoch=33
pkgdesc="Segger JLink software & documentation pack for Linux"
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
groups=('jlink')
depends=('glibc' 'libudev0-shim' 'patch')
source_x86_64=("JLink_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("JLink_Linux_${pkgver/./}_i686.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_i386.tgz")
source_armv7h=("JLink_Linux_${pkgver/./}_arm.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_arm.tgz")
source=("99-jlink.rules.patch" "JLink.svg")
desktops=(
        "JFlashExe.desktop"
        "JFlashLiteExe.desktop"
        "JFlashSPI_CL.desktop"
        "JLinkConfigExe.desktop"
        "JLinkExe.desktop"
        "JLinkGDBServer.desktop"
        "JLinkGUIServerExe.desktop"
        "JLinkLicenseManager.desktop"
        "JLinkRegistration.desktop"
        "JLinkRemoteServer.desktop"
        "JLinkRTTClient.desktop"
        "JLinkRTTLogger.desktop"
        "JLinkRTTViewer.desktop"
        "JLinkSTM32.desktop"
        "JLinkSWOViewer.desktop"
        "JMemExe.desktop"
        "JRunExe.desktop"
        "JTAGLoadExe.desktop"
)
source+=(${desktops[@]})
echo ${sources}
md5sums_i686=('ecb2229e5c0963972b8533399d16e41e')
md5sums_x86_64=('62cc06a9aea4a2617c80700fa1716eec')
md5sums_armv7h=('279bcf91b4759cc01f596435dee562e7')
md5sums=("a57d93b791581c1f36e4c672303bb85d" "83a136d31b296dd8f0e23bc21f9d8e19"
        "02e067cd1c420f2085216d76e4866cd4"
        "50bced5895a0ec59db0146153a077515"
        "395410c9819a18a659de9c80925508f1"
        "88fa3a356d20179a2cb5e6679a30c946"
        "ca75f4f47bf69df8b651b94a1b564594"
        "69516914a635e3b8c703816fb34add8b"
        "a44a41520069f29f68b14985307ac09d"
        "e763d0de7bced23342523447af761c23"
        "3d9e3093c2da9fde601b9c308296161b"
        "3cf777043c9779763fb8281cceed5d81"
        "fea9e4cf79db13c19e90af0e6ce4048a"
        "f933dfa3297baba000a0514a0c705264"
        "acf99ac26e8bf244539bbe8efec691f0"
        "9119afd453425a256aa023bae8442570"
        "24e403277bb890d915b2c454833ff3d6"
        "74cb2486441a6e571dcc3327204cd8da"
        "8fa15c29a78bf1c98af5941607ff5a2a"
        "dd0923b84488e5f1cca5192324904201"
        )

install=$pkgname.install
url="https://www.segger.com/jlink-software.html"
conflicts=("j-link-software-and-documentation")
replaces=("j-link-software-and-documentation")
DLAGENTS=("https::/usr/bin/env curl -o %o -d accept_license_agreement=accepted -d non_emb_ctr=confirmed")
options=(!strip)

prepare() {
    # Change src path name
    if [ ${CARCH} = "i686" ]; then
        mv JLink_Linux_V${pkgver/./}_i386 JLink
    else if [ ${CARCH} = "x86_64" ]; then
             mv JLink_Linux_V${pkgver/./}_x86_64 JLink
         else mv JLink_Linux_V${pkgver/./}_arm JLink
    	 fi
    fi
}

package(){
    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/JLink" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/etc/" \
            "${pkgdir}/usr/lib/udev/rules.d/" \
            "${pkgdir}/usr/share/doc/${pkgname}/" \
            "${pkgdir}/usr/share/pixmaps" \
            "${pkgdir}/usr/share/applications"

    # Install desktop entry
    for i in "${desktops[@]}"
    do
        install -Dm644 "${i}" "${pkgdir}/usr/share/applications/"
    done
    install -Dm644 "JLink.svg" "${pkgdir}/usr/share/pixmaps/JLink.svg"

    cd "${srcdir}/JLink"

    # Bulk copy everything
    if [ ${CARCH} = "armv7h" ]; then
        cp --preserve=mode -r J* Devices README.txt GDBServer lib* "${pkgdir}/opt/SEGGER/JLink"
    else cp --preserve=mode -r J* Doc Samples ETC Devices ThirdParty README.txt GDBServer lib* "${pkgdir}/opt/SEGGER/JLink"
    fi
    if [ ${CARCH} = "x86_64" ]; then
        cp --preserve=mode -r x86 "${pkgdir}/opt/SEGGER/JLink"
    fi

    # Cleanup old copy of /etc/
    rm -f ${pkgdir}/etc/JFlash

    # Create links where needed
    ln -s /opt/SEGGER/JLink/Doc/LicenseIncGUI.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    sed -i 's/0x//g' 99-jlink.rules
    patch -i "${srcdir}/99-jlink.rules.patch" 99-jlink.rules
    install -Dm644 99-jlink.rules "${pkgdir}/usr/lib/udev/rules.d/"
    rm -f "${pkgdir}/etc/udev/rules.d/99-jlink.rules"

    for f in J*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/bin"
    done
    rm "${pkgdir}/usr/bin/JLinkDevices.xml"

    for f in Doc/*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}

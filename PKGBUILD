# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-software-and-documentation
pkgver=6.90
pkgrel=3
epoch=32
pkgdesc="Segger JLink software & documentation pack for Linux"
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
groups=('jlink')
depends=('glibc' 'libudev0-shim' 'patch')
source_x86_64=("JLink_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("JLink_Linux_${pkgver/./}_i686.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_i386.tgz")
source_armv7h=("JLink_Linux_${pkgver/./}_arm.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_arm.tgz")
source=("99-jlink.rules.patch" "JLink.svg"
        "JFlashSPI_CL.desktop"
        "JLinkGDBServer.desktop"
        "JLinkLicenseManager.desktop"
        "JLinkRegistration.desktop"
        "JLinkRemoteServer.desktop"
        "JLinkRTTClient.desktop"
        "JLinkRTTLogger.desktop"
        "JLinkSTM32.desktop"
        "JLinkSWOViewer.desktop"
        "JFlashExe.desktop"
        "JFlashLiteExe.desktop"
        "JLinkConfigExe.desktop"
        "JLinkExe.desktop"
        "JLinkGUIServerExe.desktop"
        "JRunExe.desktop"
        "JMemExe.desktop"
)
md5sums_i686=('ae35689ef53f93cea52e6d2873333175')
md5sums_x86_64=('e05acfefb83caabe98f60007ac405a61')
md5sums_armv7h=('ad1c8cd84f1ebc93da197fe98d1b7430')
md5sums=("a57d93b791581c1f36e4c672303bb85d" "83a136d31b296dd8f0e23bc21f9d8e19"
         "395410c9819a18a659de9c80925508f1"
         "69516914a635e3b8c703816fb34add8b"
         "e763d0de7bced23342523447af761c23"
         "3d9e3093c2da9fde601b9c308296161b"
         "3cf777043c9779763fb8281cceed5d81"
         "fea9e4cf79db13c19e90af0e6ce4048a"
         "f933dfa3297baba000a0514a0c705264"
         "9119afd453425a256aa023bae8442570"
         "24e403277bb890d915b2c454833ff3d6"
         "02e067cd1c420f2085216d76e4866cd4"
         "50bced5895a0ec59db0146153a077515"
         "88fa3a356d20179a2cb5e6679a30c946"
         "ca75f4f47bf69df8b651b94a1b564594"
         "a44a41520069f29f68b14985307ac09d"
         "8fa15c29a78bf1c98af5941607ff5a2a"
         "74cb2486441a6e571dcc3327204cd8da"
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
    install -Dm644 "JFlashSPI_CL.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkSTM32.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkGDBServer.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkLicenseManager.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkRegistration.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkRemoteServer.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkRTTClient.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkRTTLogger.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkSWOViewer.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JFlashExe.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JFlashLiteExe.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkConfigExe.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkExe.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JLinkGUIServerExe.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JRunExe.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm644 "JMemExe.desktop" "${pkgdir}/usr/share/applications/"
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

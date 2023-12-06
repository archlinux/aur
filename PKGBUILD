# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-software-and-documentation
pkgver=7.94a
pkgrel=0
epoch=57
pkgdesc="Segger JLink software & documentation pack for Linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' )
license=('custom' 'GPLv2')
groups=('jlink')
depends=('glibc' 'libudev0-shim' 'patch')
source_x86_64=("JLink_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("JLink_Linux_${pkgver/./}_i686.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_i386.tgz")
source_armv7h=("JLink_Linux_${pkgver/./}_arm.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_arm.tgz")
source_aarch64=("JLink_Linux_${pkgver/./}_arm64.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_arm64.tgz")
source=("99-jlink.rules.patch" "99-jlink-cmsis-dap.rules" "JLink.svg")
desktops=(
        "JFlashExe.desktop"
        "JFlashLiteExe.desktop"
        "JFlashSPI_CL.desktop"
        "JFlashSPIExe.desktop"
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
        "JLinkSWOViewerExe.desktop"
        "JMemExe.desktop"
        "JRunExe.desktop"
        "JTAGLoadExe.desktop"
)
source+=(${desktops[@]})
md5sums_x86_64=('2f48830eb3a15ef65798f6bb3eff5495')
md5sums_i686=('2fb79c75a5b1bbbdc2ebf646a3c8d52d')
md5sums_aarch64=('c9ccf516c97949f89a6c73e6a799500c')
md5sums_armv7h=('f486bdf376371c0b2f0e901c2646be26')

md5sums=("a57d93b791581c1f36e4c672303bb85d"
         "02c4941650a2bd345b03dd958313d4c5"
         "83a136d31b296dd8f0e23bc21f9d8e19"
         "7b0897db15242f4130f4d38ffe17a329"
         "79491f5eaac8d23cc604e727b6c33878"
         "4c6417b588f48f5440df3d3e7e1c68de"
         "0cecd43927dd99917e8fae37f6d87790"
         "a8e55eb7a5e8a8f1d353ae32a6e9be9c"
         "9b084afb6622c02eda631100cf52804a"
         "18436972bebea03c220e36f38911c128"
         "658d2e7a802e6fa567d505cbdb580ded"
         "8bd71c09443983b64e4e1c019f515f39"
         "a234fc1f9b2c1936f02c28b5aea9db3f"
         "1f6325c794a7965b10b392b84d5d4e62"
         "3699ccea9d54cdaf42736447a77597e5"
         "e87c6d996d3b688ee1152cb82f95b4de"
         "413a5481a768a5791b8b1babdc7a367d"
         "8a42be169cf95f7cfe3017a435647492"
         "82c05490cff9899f637b9e6c95d86e47"
         "78a5e5dc623aa9e9c1ffe3974b084dfb"
         "6661cbd2790e4168cd835e50a2fb4e1d"
         "e1d104e5ee6fada9b673707b8b3e6616"
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
    fi
    if [ ${CARCH} = "x86_64" ]; then
        mv JLink_Linux_V${pkgver/./}_x86_64 JLink
    fi
    if [ ${CARCH} = "armv7h" ]; then
        mv JLink_Linux_V${pkgver/./}_arm JLink
    fi
    if [ ${CARCH} = "aarch64" ]; then
       mv JLink_Linux_V${pkgver/./}_arm64 JLink
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
        cp --preserve=mode -r J* README.txt GDBServer Firmwares lib* "${pkgdir}/opt/SEGGER/JLink"
    else cp --preserve=mode -r J* Doc Samples ETC README.txt Firmwares GDBServer lib* "${pkgdir}/opt/SEGGER/JLink"
    fi
    if [ ${CARCH} = "x86_64" ]; then
        cp --preserve=mode -r x86 "${pkgdir}/opt/SEGGER/JLink"
    fi

    # Copy ETC/JFlash at the right place
    rm -f ${pkgdir}/etc/JFlash
    cp --preserve=mode -r ETC/JFlash "${pkgdir}/etc/"

    # Create links where needed
    ln -s /opt/SEGGER/JLink/Doc/LicenseIncGUI.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    sed -i 's/0x//g' 99-jlink.rules
    patch -i "${srcdir}/99-jlink.rules.patch" 99-jlink.rules
    install -Dm644 99-jlink.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -Dm644 "${srcdir}/99-jlink-cmsis-dap.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
    rm -f "${pkgdir}/etc/udev/rules.d/99-jlink.rules"

    for f in J*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/bin"
    done

    for f in Doc/*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}

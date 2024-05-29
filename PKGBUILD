# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-software-and-documentation
pkgver=7.96j
pkgrel=0
epoch=60
pkgdesc="Segger JLink software & documentation pack for Linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' )
license=('custom' 'GPLv2')
groups=('jlink')
depends=('glibc' 'libudev0-shim' 'patch')
source_x86_64=("JLink_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_x86_64.deb")
source_i686=("JLink_Linux_${pkgver/./}_i686.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_i386.deb")
source_armv7h=("JLink_Linux_${pkgver/./}_arm.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_arm.deb")
source_aarch64=("JLink_Linux_${pkgver/./}_arm64.tgz::https://www.segger.com/downloads/jlink/JLink_Linux_V${pkgver/./}_arm64.deb")
source=("99-jlink.rules.patch" "JLink.svg")
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
md5sums_x86_64=('38ed3a9504abbe086593bbf80123d3ff')
md5sums_i686=('897c386cba7f01582c98c69186368a53')
md5sums_aarch64=('238e06e4ee37c9a23df413a458e73a02')
md5sums_armv7h=('a80c52ba70509c6c88e2a140842d9561')

md5sums=("a57d93b791581c1f36e4c672303bb85d"
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

package(){
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    chmod -R 0755 "$pkgdir/"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" \
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

    # Create links where needed
    ln -s /opt/SEGGER/JLink/Doc/LicenseIncGUI.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    # Patch udev file
    sed -i 's/0x//g' "${pkgdir}/etc/udev/rules.d/99-jlink.rules"
    patch -i "${srcdir}/99-jlink.rules.patch" "${pkgdir}/etc/udev/rules.d/99-jlink.rules"
    mv "${pkgdir}/etc/udev/rules.d/99-jlink.rules" "${pkgdir}/usr/lib/udev/rules.d/"

    ln -s "${pkgdir}/JLink/Doc" "${pkgdir}/usr/share/doc/${pkgname}"

}

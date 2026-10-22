# Maintainer: taotieren <admin@taotieren.com>

pkgname=flasher-software-and-documentation
pkgver=9.86
pkgrel=1
pkgdesc="Segger Flasher Software and Documentation Pack for Linux"
arch=('x86_64' 'aarch64')
license=('custom')
# groups=('flasher')
depends=(
    libgcc
    libstdc++
)
source_x86_64=("Flasher_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/flasher/Flasher_Linux_V${pkgver/./}_x86_64.tgz")
source_aarch64=("Flasher_Linux_${pkgver/./}_arm64.tgz::https://www.segger.com/downloads/flasher/Flasher_Linux_V${pkgver/./}_arm64.tgz")
source=("Flasher.svg")
sha256sums=('debad3e258c6fca6b7c58dbe711eee366eeef0e0f021eee4810281e93afa758b')
sha256sums_x86_64=('e3bd9378bd6a0569bea027aaa507352f9829ba362a78b69609fc4c2bdeea3ad0')
sha256sums_aarch64=('5808535584a5b5a19f84e213a3363917968c753ae3048c3b09b1530b2c0f5658')
install=$pkgname.install
url="https://www.segger.com/program-embedded-systems/"
conflicts=("${pkgname}" "j-link-software-and-documentation")
replaces=("${pkgname}" "j-link-software-and-documentation")
conflicts=("${pkgname}")
replaces=("${pkgname}")
DLAGENTS=("https::/usr/bin/env curl -A Mozilla/5.0(Linuxx86_64;rv:120.0)Gecko/20100101Firefox/120.0 -e https://www.segger.com/downloads/flasher/ -o %o -d accept_license_agreement=accepted -d non_emb_ctr=confirmed")
options=(!strip)

prepare() {
    # Change src path name
    if [ ${CARCH} = "x86_64" ]; then
        mv Flasher_Linux_V${pkgver/./}_x86_64 Flasher
    fi
    if [ ${CARCH} = "aarch64" ]; then
       mv Flasher_Linux_V${pkgver/./}_arm64 Flasher
    fi
}

package(){
    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Flasher" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/lib/udev/rules.d/" \
            "${pkgdir}/usr/share/doc/${pkgname}/" \
            "${pkgdir}/usr/share/pixmaps" \
            "${pkgdir}/usr/share/applications"

    install -Dm644 "Flasher.svg" -t "${pkgdir}/usr/share/pixmaps/"

    cd "${srcdir}/Flasher"

    # Bulk copy everything
    cp --preserve=mode -r J* *Flasher* Doc Devices_* DevProExe Script Samples ETC README.txt Firmwares lib* "${pkgdir}/opt/SEGGER/Flasher"

    # Create links where needed
    ln -s /opt/SEGGER/Flasher/Doc/LicenseIncGUI.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    sed -i -e 's/dialout/uucp/g' \
        -e 's/MODE="0666"/TAG+="uaccess"/' 99-flasher.rules
    install -Dm644 99-flasher.rules -t "${pkgdir}/usr/lib/udev/rules.d/"

    # Flasher executables: create /usr/bin symlink + XDG desktop entry
    local exes=(
        FlasherConfigExe
        FlasherControlExe
        FlasherDeployerExe
        FlasherRunExe
        FlasherTerminalExe
        FlasherUSBWebServerExe
        UniversalFlasherCLExe
        UniversalFlasherExe
        DevProExe
        JFlashExe
        JFlashSPIExe
        JLinkGUIServerExe
        JLinkRegistrationExe
        JTAGLoadExe
    )
    for exe in "${exes[@]}"; do
        ln -sf "/opt/SEGGER/Flasher/${exe}" "${pkgdir}/usr/bin/${exe}"
        install -vDm644 /dev/stdin "${pkgdir}/usr/share/applications/${exe}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Segger ${exe}
Comment=Segger ${exe} for Linux
Exec=${exe}
Icon=Flasher
Terminal=false
StartupNotify=false
Categories=Development
EOF
    done

    for f in Doc/*; do
        ln -s /opt/SEGGER/Flasher/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}

# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Nico Rumpeltin <$forename at $surname dot de>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
#
pkgbase=quartus-free
_components=(${pkgbase}-{quartus,modelsim,help,devinfo-{arria_lite,cyclone{,10lp,v},max{,10}}})
pkgname=(${pkgbase} ${_components[@]})
_mainver=20.1
# Keep dot in _patchver
_patchver=.0
_buildver=711
_basever=.0.711
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="Quartus Prime Lite design software for Intel FPGAs"
arch=('x86_64')
url="http://fpgasoftware.intel.com/?edition=lite"
license=('custom')

_alteradir="/opt/intelFPGA/${_mainver}"

# According to the installer script, these dependencies are needed for the installer
depends=('lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-glibc'
         'lib32-gtk2' 'lib32-libcanberra' 'lib32-libpng' 'lib32-libice' 'lib32-libsm'
         'lib32-util-linux' 'lib32-ncurses' 'lib32-ncurses5-compat-libs' 'lib32-zlib'
         'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxft'
         'lib32-libxrender' 'lib32-libxt' 'lib32-libxtst')

makedepends=('patchelf')

source=("http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusLiteSetup-${pkgver}-linux.run"
        "http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/ModelSimSetup-${pkgver}-linux.run"
        "http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusHelpSetup-${pkgver}-linux.run"
        "http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/"{arria_lite,cyclone{,10lp,v},max{,10}}"-${pkgver}.qdz"
        'quartus.sh' 'quartus.desktop' 'modelsim-ase.sh' 'modelsim-ase.desktop' '51-usbblaster.rules')
noextract=({arria_lite,cyclone{,10lp,v},max{,10}}"-${pkgver}.qdz") # Will extract directly to pkgdir
md5sums=('e995b65f09aa0855770a2315cf7bc2ff'
         '6c0b26510477d20896becca042c33917'
         'cbfc39a16bc6fcbb6862aa676e2fbcfb'
         'a439bb4873e69bd23e35aced3ea9ba8c'
         '14e47510cea47dc0ed92c8cb97d76488'
         'af64dc8c95035dd084e9e8b621eb1378'
         '2b30d36171d1beb159971f89206e6d9f'
         '2ef442bc8872aa4e39ed3b313e13cc2a'
         '10284d71211a02f6dd20cbc41c9ececb'
         '737d51fcc74c8d6d2114c8f4ba79e4de'
         'c5a8f6310ade971f07e5ee6c4e338054'
         'ea5eca3341da1628e57f3efb7e074796'
         'a32f9e42db394016ce267c8d96f69cd5'
         'f5744dc4820725b93917e3a24df13da9')

options=(!strip !debug) # Stripping will takes ages, I'd avoid it
PKGEXT=".pkg.tar.zst" # ZSTD is fast enough for compression

prepare() {
    echo "Notice: Requires around 20GB of free space during package building!"
    echo "Notice: The package files also requires around 8GB of free space"

    chmod +x {QuartusLite,ModelSim,QuartusHelp}Setup-${pkgver}-linux.run
}

package_quartus-free() {
    depends=(${_components[@]})
    pkgdesc="Meta-package containing all Quartus Prime Lite tools and device libraries"
}

package_quartus-free-quartus() {
    depends+=(quartus-free-devinfo)
    optdepends=("eclipse: For Nios II EDS")

    DISPLAY="" ./QuartusLiteSetup-${pkgver}-linux.run \
        --disable-components quartus_help,devinfo,modelsim_ase,modelsim_ae \
        --mode unattended \
        --unattendedmodeui none \
        --accept_eula 1 \
        --installdir "${pkgdir}${_alteradir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    # Remove useless unzip binaries
    find "${pkgdir}${_alteradir}" \( -name "unzip" -or -name "unzip32" \) -delete

    # Remove duplicated file from help
    rm -r "${pkgdir}${_alteradir}/quartus/common/help/webhelp"

    # Fix interpreter for the license manager
    for prog in quartus/linux64/{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${pkgdir}${_alteradir}/${prog}"
    done

    # Fix missing permissions
    find "${pkgdir}${_alteradir}" \! -perm /o+rwx -exec chmod o=g {} \;

    # Replace altera directory in integration files
    sed -i "s,_alteradir,${_alteradir},g" quartus.sh
    sed -i "s,_alteradir,${_alteradir},g" quartus.desktop

    # Remove pkgdir reference in sopc_builder
    sed -i "s,${pkgdir},,g" "${pkgdir}${_alteradir}/quartus/sopc_builder/.sopc_builder"

    # Fix world writable permissions
    find "${pkgdir}${_alteradir}/nios2eds/documents" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_alteradir}/quartus/common/tcl" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_alteradir}/quartus/linux64" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_alteradir}/quartus/sopc_builder/bin/europa" -perm -o+w -exec chmod go-w {} \+

    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
}

package_quartus-free-modelsim() {
    depends+=(lib32-alsa-lib lib32-libxi lib32-libxml2)
    pkgdesc="Quartus Prime Lite - ModelSim-Intel FPGA Starter Edition"

    DISPLAY="" ./ModelSimSetup-${pkgver}-linux.run \
        --modelsim_edition modelsim_ase \
        --mode unattended \
        --unattendedmodeui none \
        --accept_eula 1 \
        --installdir "${pkgdir}${_alteradir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    for prog in modelsim_ase/linuxaloem/mgls/bin/{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib/ld-linux.so.2 "${pkgdir}${_alteradir}/${prog}"
    done

    # Fix missing permissions
    find "${pkgdir}${_alteradir}" \! -perm /o+rwx -exec chmod o=g {} \;

    # Replace altera directory in integration files
    sed -i "s,_alteradir,${_alteradir},g" modelsim-ase.sh
    sed -i "s,_alteradir,${_alteradir},g" modelsim-ase.desktop

    # Fix modelsim startup code for Linux Kernel >=4.0
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software
    sed -i 's,linux_rh60,linux,g' "${pkgdir}${_alteradir}/modelsim_ase/vco"

    # Suppress spurious warning about linux-gate.so.1
    sed -i '/msg_system/a suppress = 3116' "${pkgdir}${_alteradir}/modelsim_ase/modelsim.ini"

    # Install integration files
    install -D -m755 modelsim-ase.sh "${pkgdir}/etc/profile.d/modelsim-ase.sh"
    install -D -m644 modelsim-ase.desktop "${pkgdir}/usr/share/applications/modelsim-ase.desktop"
}

package_quartus-free-help() {
    depends=(quartus-free-quartus)
    pkgdesc="Quartus Prime Lite - help files"

    DISPLAY="" ./QuartusHelpSetup-${pkgver}-linux.run --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_alteradir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"
}

for _dev in {arria_lite,cyclone{,10lp,v},max{,10}}; do
    eval "
package_${pkgbase}-devinfo-${_dev}() {
   provides=(quartus-free-devinfo)
   pkgdesc='Quartus Prime Lite - devinfo files for ${_dev}'
   install -d \"\${pkgdir}\${_alteradir}\"
   bsdtar -xf \"${_dev}-\${pkgver}.qdz\" -C \"\${pkgdir}\${_alteradir}\"
}
"
done

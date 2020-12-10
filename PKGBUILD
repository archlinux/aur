# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Nico Rumpeltin <$forename at $surname dot de>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
#
pkgbase=quartus-free
_components=(${pkgbase}-{quartus,modelsim,help,devinfo-{arria_lite,cyclone{,10lp,v},max{,10}},hls})
pkgname=(${pkgbase} ${_components[@]})
# Keep dot in _patchver
_mainver=20.1; _patchver=.1; _buildver=720
# Latest HLS compiler was only released with Pro numbering
_promain=20.3; _propatch=.0; _probuild=158; _prover=${_promain}${_propatch}.${_probuild}
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="Quartus Prime Lite design software for Intel FPGAs"
arch=('x86_64')
url="http://fpgasoftware.intel.com/?edition=lite"
license=('custom')

_alteradir="/opt/intelFPGA/${_mainver}"

# According to the installer script, these dependencies are needed for the installer
depends=('ld-lsb' 'lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-glibc'
         'lib32-gtk2' 'lib32-libcanberra' 'lib32-libpng' 'lib32-libice' 'lib32-libsm'
         'lib32-util-linux' 'lib32-ncurses' 'lib32-ncurses5-compat-libs' 'lib32-zlib'
         'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxft'
         'lib32-libxrender' 'lib32-libxt' 'lib32-libxtst')

_base_url="https://download.altera.com/akdlm/software/acdsinst"
source=("${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusLiteSetup-${pkgver}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/ModelSimSetup-${pkgver}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusHelpSetup-${pkgver}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/"{arria_lite,cyclone{,10lp,v},max{,10}}"-${pkgver}.qdz"
        "${_base_url}/${_promain}${_propatch/.0/}/${_probuild}/ib_installers/HLSProSetup-${_prover}-linux.run"
        'quartus.sh' 'quartus.desktop' 'modelsim-ase.sh' 'modelsim-ase.desktop' '51-usbblaster.rules')
noextract=({arria_lite,cyclone{,10lp,v},max{,10}}"-${pkgver}.qdz") # Will extract directly to pkgdir
md5sums=('3a5ca38169bcff285611789850b5af83'
         'adfdde0d455dadedd2cc094cbf771352'
         '1f1a52ba830b7496a1276c15a7fe067a'
         '4561d23010dd1fd359fe12348b102ac6'
         'e6527cbc876426c4ecd8737d8b68369c'
         'd47100035a5a97f44048df19218b09e4'
         '78d59d548756f81e67b9d7cd2149e2b8'
         '9e8b802c6b4768933362a0e6398b7e2e'
         'fea82df785421cd0c0bf75ca94790804'
         '20a76b8373fcab2ceb35d2003a0630d1'
         '60fbfafbaa565af5e97b2904914e41e7'
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

package_quartus-free-hls() {
    depends=(quartus-free-quartus)
    pkgdesc="Quartus Prime - HLS compiler"

    chmod a+x HLSProSetup-${_prover}-linux.run
    DISPLAY="" ./HLSProSetup-${_prover}-linux.run --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_alteradir}"

    # Fix path to Lite qsys-script
    sed -i '429s,../qsys,sopc_builder,' "${pkgdir}${_alteradir}/hls/init_hls.sh"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"
}

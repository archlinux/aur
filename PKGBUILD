# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Nico Rumpeltin <$forename at $surname dot de>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>

pkgbase=quartus-free
_components=(${pkgbase}-{quartus,questa,help,riscfree,devinfo-{arria_lite,cyclone{,10lp,v},max{,10}}})
pkgname=(${pkgbase} ${_components[@]})
# Keep dot in _patchver
_mainver=24.1; _patchver=.0; _buildver=1077; _litever=${_mainver}std${_patchver}.${_buildver}
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="Quartus Prime Lite design software for Intel FPGAs"
arch=('x86_64')
url="http://fpgasoftware.intel.com/?edition=lite"
license=('custom')

_inteldir="/opt/intelFPGA/${_mainver}"

# See individual packages
depends=()

_base_url="https://downloads.intel.com/akdlm/software/acdsinst"
source=("${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusLiteSetup-${_litever}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuestaSetup-${_litever}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusHelpSetup-${_litever}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/RiscFreeSetup-${_litever}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/"{arria_lite,cyclone{,10lp,v},max{,10}}"-${_litever}.qdz"
        'quartus.sh' 'quartus.desktop' 'questa-fse.sh' 'questa-fse.desktop' 'questa.gif' '51-usbblaster.rules')
noextract=({arria_lite,cyclone{,10lp,v},max{,10}}"-${_litever}.qdz") # Will extract directly to pkgdir
# Still using SHA1 because it's given in the download site
sha1sums=(
    62a899e695d4ea478bc51850867cf6222d9589cf
    3bc55724807c4792e6bc71dfe454378474b9a4a1
    74bb418ec7f09600c2752ce863e345888a503fd0
    60fb94c7d52fc4ca28166409210b32c2bd1c2ffd
    439ff4f6c30826a1c78868db2e1a411e2100529a
    176c1f54c7da0623555a02864d3eb144fe6c00d3
    175bee73df92c219fecc8e4e90f2a67cf9f84eee
    a361c6ab1aba00f6385fc8deb8b81045c3f9ad7c
    f1d486d19a8fb298cb4e1d45a69c55a6de7e582c
    32ca623f33df3ffec1b6ee585a034db6e8c36d02
    f6d660c62a71ac650f23f1ab8ab272eef445632a
    2efb252903bed064dd1ce5ced3ba84de2d5ef280
    b69614473e3f622676dcbb7a9a91e65003b3550c
    da7c90d1569c2819e37315daf0c4e2f894683318
    20224d8007807eed71b27783bb95c73faf6de20b
    45a7d09831554252715e5fa377db0c04c553e833
)

options=('!strip' '!debug') # Stripping will takes ages, I'd avoid it
PKGEXT=".pkg.tar.zst" # ZSTD is fast enough for compression

prepare() {
    echo "Notice: Requires around 30GB of free space, of which 21GB in build dir, during package building!"
    echo "Notice: The compressed package files also require around 10GB of free space"

    chmod +x {QuartusLite,Questa,QuartusHelp,RiscFree}Setup-${_litever}-linux.run
}

package_quartus-free() {
    depends=(${_components[@]})
    pkgdesc="Meta-package containing all Quartus Prime Lite tools and device libraries"
}

package_quartus-free-quartus() {
    depends=(ld-lsb alsa-lib bzip2 dbus expat fontconfig freetype2 gcc-libs glib2 lib32-gcc-libs lib32-glibc
             libdrm libice libjpeg6 libpng12 libpulse libsm libudev0-shim libx11 libxau libxext libxi libxml2
             libxrender libxtst libxcrypt-compat ncurses5-compat-libs util-linux-libs zlib quartus-free-devinfo)
    optdepends=("eclipse: For Nios II EDS")

    DISPLAY="" ./QuartusLiteSetup-${_litever}-linux.run \
        --disable-components quartus_help,devinfo,questa_fse,questa_fe \
        --mode unattended \
        --unattendedmodeui none \
        --accept_eula 1 \
        --installdir "${pkgdir}${_inteldir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/"{uninstall,logs}

    # Remove useless unzip binaries
    find "${pkgdir}${_inteldir}" -name unzip -delete

    # Remove duplicated file from help
    rm -r "${pkgdir}${_inteldir}/quartus/common/help/webhelp"

    # Split RiscFree to a separate package
    rm -r "${pkgdir}${_inteldir}/riscfree"

    # Fix missing permissions
    find "${pkgdir}${_inteldir}" \! -perm /o+rwx -exec chmod o=g {} \;

    # Replace altera directory in integration files
    sed -i "s,@_inteldir@,${_inteldir},g" quartus.sh
    sed -i "s,@_inteldir@,${_inteldir},g" quartus.desktop

    # Remove pkgdir reference in sopc_builder
    sed -i "s,${pkgdir},,g" "${pkgdir}${_inteldir}/quartus/sopc_builder/.sopc_builder"

    # Fix world writable permissions
    find "${pkgdir}${_inteldir}/nios2eds/documents" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_inteldir}/nios2eds/bin" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_inteldir}/ip/altera/mentor_vip_ae" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_inteldir}/quartus/dspba" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_inteldir}/quartus/common/tcl" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_inteldir}/quartus/linux64" -perm -o+w -exec chmod go-w {} \+
    find "${pkgdir}${_inteldir}/quartus/sopc_builder/bin/europa" -perm -o+w -exec chmod go-w {} \+

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_inteldir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
}

package_quartus-free-questa() {
    depends=(expat fontconfig freetype2 gcc-libs gd lib32-gcc-libs lib32-glibc lib32-libxml2
             libjpeg6 libpng12 libx11 libxext libxft libxml2 libxpm ncurses5-compat-libs zlib)
    pkgdesc="Quartus Prime Lite - Questa-Intel FPGA Starter Edition"

    DISPLAY="" ./QuestaSetup-${_litever}-linux.run \
        --questa_edition questa_fse \
        --mode unattended \
        --unattendedmodeui none \
        --accept_eula 1 \
        --installdir "${pkgdir}${_inteldir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/"{uninstall,logs}

    # Fix missing permissions
    find "${pkgdir}${_inteldir}" \! -perm /o+rwx -exec chmod o=g {} \;

    # Replace altera directory in integration files
    sed -i "s,@_inteldir@,${_inteldir},g" questa-fse.sh
    sed -i "s,@_inteldir@,${_inteldir},g" questa-fse.desktop

    # Add application icon
    install -D -m644 "${srcdir}/questa.gif" "${pkgdir}${_inteldir}/questa_fse/questa.gif"

    # Suppress spurious warning about linux-gate.so.1
    #sed -i '/msg_system/a suppress = 3116' "${pkgdir}${_inteldir}/questa_fse/modelsim.ini"

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_inteldir}/questa_fse/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m755 questa-fse.sh "${pkgdir}/etc/profile.d/questa-fse.sh"
    install -D -m644 questa-fse.desktop "${pkgdir}/usr/share/applications/questa-fse.desktop"
}

package_quartus-free-help() {
    depends=(quartus-free-quartus)
    pkgdesc="Quartus Prime Lite - help files"

    DISPLAY="" ./QuartusHelpSetup-${_litever}-linux.run --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_inteldir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/"{uninstall,logs}

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_inteldir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_quartus-free-riscfree() {
    depends=(quartus-free-quartus)
    pkgdesc="Quartus Prime Lite - RiscFree IDE for Altera"

    DISPLAY="" ./RiscFreeSetup-${_litever}-linux.run --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_inteldir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/"{uninstall,logs}

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_inteldir}/riscfree/licenses/license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _dev in {arria_lite,cyclone{,10lp,v},max{,10}}; do
    eval "
package_${pkgbase}-devinfo-${_dev}() {
   provides=(quartus-free-devinfo)
   depends=()
   pkgdesc='Quartus Prime Lite - devinfo files for ${_dev}'
   install -d \"\${pkgdir}\${_inteldir}\"
   bsdtar -xf \"${_dev}-\${_litever}.qdz\" -C \"\${pkgdir}\${_inteldir}\"
}
"
done

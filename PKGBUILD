# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Nico Rumpeltin <$forename at $surname dot de>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>

pkgbase=quartus-free
_components=(${pkgbase}-{quartus,questa,help,devinfo-{arria_lite,cyclone{,10lp,v},max{,10}},hls})
pkgname=(${pkgbase} ${_components[@]})
# Keep dot in _patchver
_mainver=23.1; _patchver=.0; _buildver=991; _litever=${_mainver}std${_patchver}.${_buildver}
# HLS compiler is only released with Pro numbering
_promain=23.4; _propatch=.0; _probuild=79; _prover=${_promain}${_propatch}.${_probuild}
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
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/"{arria_lite,cyclone{,10lp,v},max{,10}}"-${_litever}.qdz"
        "${_base_url}/${_promain}${_propatch/.0/}/${_probuild}/ib_installers/HLSProSetup-${_prover}-linux.run"
        'quartus.sh' 'quartus.desktop' 'questa-fse.sh' 'questa-fse.desktop' 'questa.gif' '51-usbblaster.rules')
noextract=({arria_lite,cyclone{,10lp,v},max{,10}}"-${_litever}.qdz") # Will extract directly to pkgdir
# Still using SHA1 because it's given in the download site
sha1sums=(
    7f8cc416092710c47270ef1550a0d0bc2bfb7a10
    a62f877e759b9bcd636404531376b33f163443b8
    33716a5c1372402e2b96681ba748d4cb231fdfb2
    9481182af9eb308e606a31f91add38a9014cb4a5
    c1c433474329664fd3041914e7e94648fab06062
    72b1b9a18dc28f26604522d3b3e14e29ecdfdb4c
    8c08c3c2f8c54ef756ebf1a04f8da74f748009bb
    e1761953d705c706e6700812ba3ccbe67f52abce
    80109b586c8a8a4b68b319accb03ede4ef39a0a0
    1f0661ae0093c1f16d40da01f9acf9767562a45b
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
    echo "Notice: Requires around 30GB of free space, of which 15GB in build dir, during package building!"
    echo "Notice: The package files also requires around 11GB of free space"

    chmod +x {QuartusLite,Questa,QuartusHelp}Setup-${_litever}-linux.run
    chmod +x HLSProSetup-${_prover}-linux.run
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

package_quartus-free-hls() {
    depends=(quartus-free-quartus ocl-icd)
    pkgdesc="Quartus Prime - HLS compiler"

    DISPLAY="" ./HLSProSetup-${_prover}-linux.run --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_inteldir}"

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_inteldir}/licenses/hls_lic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 00755 "${pkgdir}${_inteldir}/licenses"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/"{uninstall,logs}
}

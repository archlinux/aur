# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Nico Rumpeltin <$forename at $surname dot de>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>

pkgbase=quartus-free
_components=(${pkgbase}-{quartus,questa,help,devinfo-{arria_lite,cyclone{,10lp,v},max{,10}},hls})
pkgname=(${pkgbase} ${_components[@]})
# Keep dot in _patchver
_mainver=21.1; _patchver=.0; _buildver=842
# Latest HLS compiler was only released with Pro numbering
_promain=21.3; _propatch=.0; _probuild=170; _prover=${_promain}${_propatch}.${_probuild}
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="Quartus Prime Lite design software for Intel FPGAs"
arch=('x86_64')
url="http://fpgasoftware.intel.com/?edition=lite"
license=('custom')

_inteldir="/opt/intelFPGA/${_mainver}"

# See individual packages
depends=()

_base_url="https://download.altera.com/akdlm/software/acdsinst"
source=("${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusLiteSetup-${pkgver}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuestaSetup-${pkgver}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusHelpSetup-${pkgver}-linux.run"
        "${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/"{arria_lite,cyclone{,10lp,v},max{,10}}"-${pkgver}.qdz"
        "${_base_url}/${_promain}${_propatch/.0/}/${_probuild}/ib_installers/HLSProSetup-${_prover}-linux.run"
        'quartus.sh' 'quartus.desktop' 'questa-fse.sh' 'questa-fse.desktop' 'questa.gif' '51-usbblaster.rules')
noextract=({arria_lite,cyclone{,10lp,v},max{,10}}"-${pkgver}.qdz") # Will extract directly to pkgdir
md5sums=('9b5f01ab0f5d3c591fc1802357e064d7'
         '18ecba3798924467b82f229469f40842'
         '44c0d88b372dd13ce3f9f504c124fe67'
         'a2d16c109493c37bb5d10bcd3a54f58c'
         'e37015353737752218908311e2e915f5'
         '2061e55e14fa6419376bea1ff8bba3c1'
         '5d3df782ac7f408f8166e58af030ff9b'
         '8657de76ca949c8b435146f79bd39ef9'
         'cb403b4794fba35c13075bf2234c7e2b'
         'fa89e11f176f02c27beb16e4faf98a14'
         'c3de75ed812e3810e5ba2bcb76f9d9b6'
         'fce8bb5015acd892d829c8ce83be8ba6'
         '44cf36c918ea51bcec780c4f571fb342'
         '0a502c89020da0b5bd77865550341a0b'
         '7d422454a0776d6f0cd469c5ab3ed869'
         '7f6bc8dfa926ce4721ba6290b15e0f65')

options=('!strip' '!debug') # Stripping will takes ages, I'd avoid it
PKGEXT=".pkg.tar.zst" # ZSTD is fast enough for compression

prepare() {
    echo "Notice: Requires around 20GB of free space during package building!"
    echo "Notice: The package files also requires around 8GB of free space"

    chmod +x {QuartusLite,Questa,QuartusHelp}Setup-${pkgver}-linux.run
    chmod +x HLSProSetup-${_prover}-linux.run
}

package_quartus-free() {
    depends=(${_components[@]})
    pkgdesc="Meta-package containing all Quartus Prime Lite tools and device libraries"
}

package_quartus-free-quartus() {
    depends=(ld-lsb alsa-lib bzip2 dbus expat fontconfig freetype2 gcc-libs glib2 lib32-gcc-libs lib32-glibc
             libdrm libice libjpeg6 libpng12 libpulse libsm libudev0-shim libx11 libxau libxext libxi libxml2
             libxrender libxtst ncurses5-compat-libs util-linux-libs zlib quartus-free-devinfo)
    optdepends=("eclipse: For Nios II EDS")

    DISPLAY="" ./QuartusLiteSetup-${pkgver}-linux.run \
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

    DISPLAY="" ./QuestaSetup-${pkgver}-linux.run \
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

    DISPLAY="" ./QuartusHelpSetup-${pkgver}-linux.run --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_inteldir}"

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
   bsdtar -xf \"${_dev}-\${pkgver}.qdz\" -C \"\${pkgdir}\${_inteldir}\"
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

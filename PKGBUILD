# Maintainer:  Randolph Ha <raster.dynamo-2h.icloud@com>

pkgbase=quartus-pro
_components=(${pkgbase}-{quartus,questa,help,riscfree,eda_cdclib,devinfo-{agilex,arria10,cyclone10gx,stratix10}})
pkgname=(${pkgbase} ${_components[@]})
# Keep dot in _patchver so regex to filter URLs for _patchver=.0 works
_mainver=26.1; _patchver=.0; _buildver=110
_urlver="${_mainver}${_patchver/.0/}/${_buildver}"; _filver="${_mainver}${_patchver}.${_buildver}"
pkgver=${_filver}
pkgrel=1
pkgdesc="Quartus Prime Pro design software for Intel FPGAs"
arch=('x86_64')
url="https://www.altera.com/downloads/fpga-development-tools/quartus-prime-pro-edition-design-software-version-26-1-linux"
license=('LicenseRef-QuartusPrime')

_instdir="/opt/altera_pro/${_mainver}"

# See individual packages
depends=()

_base_url="https://downloads.intel.com/akdlm/software/acdsinst"
source=("${_base_url}/${_urlver}/ib_installers/QuartusProSetup-${_filver}-linux.run"
        "${_base_url}/${_urlver}/ib_installers/QuartusProSetup-part2-${_filver}.qdz"
        "${_base_url}/${_urlver}/ib_installers/QuestaSetup-${_filver}-linux.run"
        "${_base_url}/${_urlver}/ib_installers/QuartusProHelpSetup-${_filver}-linux.run"
        "${_base_url}/${_urlver}/ib_installers/RiscFreeSetup-${_filver}-linux.run"
        "${_base_url}/${_urlver}/ib_installers/eda_"{cdc,sim}"lib-${_filver}-linux.qdz"
        "${_base_url}/${_urlver}/ib_installers/"{agilex{3,5,7,_common},arria10,cyclone10gx,stratix10}"-${_filver}.qdz"
        # Rename files to avoid conflicting with quartus-free
        'quartus-pro.desktop' 'questa-fse-pro.desktop' 'questa.gif' '51-usbblaster-pro.rules')
noextract=("QuartusProSetup-part2-${_filver}.qdz"
           "eda_"{cdc,sim}"lib-${_filver}-linux.qdz"
           {agilex{3,5,7,_common},arria10,cyclone10gx,stratix10}"-${_filver}.qdz") # Will extract directly to pkgdir
# Still using SHA1 because it's given in the download site
sha1sums=(
    694c03383a30c196440a22cb75f045cd1cdb40ef # QuartusProSetup
    99aab564ca8035beab7e083eaf2524b7cdbbb16e # QuartusProSetup-part2
    d7d431325762e343a39a1e4e6a8a97d46923b8b1 # QuestaSetup
    6817d60872172c44c62fc8f7a1a6fb44afec17a7 # QuartusProHelpSetup
    0cbdb211af09c861653e9c71ee70b6eff7d14d32 # RiscFreeSetup
    757551153ab07d4d89930a77f6de306f10ac4617 # eda_cdclib
    531379202a1aa656af2c107aa28e518cd63a6136 # eda_simlib
    c8a9c4a05e77ed4a86d941702a15bd055060acab # agilex3
    57a63a203f4e4d0efdd2d9936d8a7a871706ca33 # agilex5
    9c9d8172723d3ee5b3f33ec0a9edb3545e7de4df # agilex7
    ba5caf895dbe40cb96c3df76332c2db32059c83c # agilex_common
    f998b82882f664d9694f5ecee8292682499c23e5 # arria10
    a3f1c0aff500292bb59997d9672b0e55ee1e599e # cyclone10gx
    e10f405331e394dab768311afc67042806d82491 # stratix10

    3e7d319306c7c73bf5c8d867df206912b2c0d8e6 # quartus-pro.desktop
    c51b7de3701af0088bb924295f153bb2439d927d # questa-fse-pro.desktop
    20224d8007807eed71b27783bb95c73faf6de20b # questa.gif
    8264e342640583e31777782a8584566cb0cc7351 # 51-usbblaster-pro.rules
)

options=('!strip' '!debug') # Stripping will takes ages, I'd avoid it

prepare() {
    echo "Notice: Requires around 240GB of free space, of which 154GB in build dir, during package building!"
    echo "Notice: The compressed package files also require around 84GB of free space"

    chmod +x {QuartusPro,Questa,QuartusProHelp,RiscFree}Setup-${_filver}-linux.run
}

package_quartus-pro() {
    depends=(${_components[@]})
    pkgdesc="Meta-package containing all Quartus Prime Pro tools and device libraries"
}

package_quartus-pro-quartus() {
    depends=(ld-lsb alsa-lib bzip2 dbus expat fontconfig freetype2 gcc-libs glib2 lib32-gcc-libs lib32-glibc
             libdrm libice libpulse libsm libx11 libxau libxext libxi libxml2
             libxrender libxtst libxcrypt-compat ncurses5-compat-libs util-linux-libs zlib quartus-pro-devinfo)
    optdepends=("eclipse: For Nios II EDS")
    pkgdesc="Quartus Prime Pro - Base installation"

    # Some notes here:
    # 1) I think disabling devinfo disables all boards (agilex5, cyclone10gx, etc.)
    # 2) Pretty sure the programmer, emb, driver .run's are just subcomponents already installed with this
    # 3) Maybe quartus_update is for Altera Remote Update?
    # 4) Can't install eda_simlib separately, it would overwrite files from quartus-pro-quartus
    # 5) Sorry, but easicn5x doesn't have an independent .qdz file, so it doesn't get support.
    ./QuartusProSetup-${_filver}-linux.run \
        --disable-components quartus_help,eda_cdclib,devinfo,riscfree,questa_fse,questa_fe \
        --mode unattended \
        --accept_eula 1 \
        --installdir "${pkgdir}${_instdir}"

    # Fix broken openocd board config
    mv "${pkgdir}${_instdir}/quartus/linux64/oocd/openocd/scripts/target/"{1986Ð²Ðµ1Ñ.cfg,1986ве1т.cfg}
    mv "${pkgdir}${_instdir}/quartus/linux64/oocd/openocd/scripts/target/"{Ðº1879xÐ±1Ñ.cfg,к1879хб1я.cfg}

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_instdir}/"{uninstall,logs}

    # Remove useless unzip binaries
    find "${pkgdir}${_instdir}" -name unzip -delete

    # Remove duplicated file from help
    rm -r "${pkgdir}${_instdir}/quartus/common/help/webhelp"

    # Fix missing permissions
    find "${pkgdir}${_instdir}" \! -perm /o+rwx -exec chmod o=g {} +

    # Replace altera directory in integration files
    sed -i "s,@_instdir@,${_instdir},g" quartus-pro.desktop

    # Remove pkgdir reference in sopc_builder
    sed -i "s,${pkgdir},,g" "${pkgdir}${_instdir}/quartus/sopc_builder/.sopc_builder"

    # Fix world writable permissions
    find "${pkgdir}${_instdir}/quartus/dspba" -perm -o+w -exec chmod go-w {} +
    find "${pkgdir}${_instdir}/quartus/common/tcl" -perm -o+w -exec chmod go-w {} +
    find "${pkgdir}${_instdir}/quartus/linux64" -perm -o+w -exec chmod go-w {} +
    find "${pkgdir}${_instdir}/quartus/sopc_builder/bin/europa" -perm -o+w -exec chmod go-w {} +

    # Remove sticky bit from directories
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_instdir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m644 51-usbblaster-pro.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster-pro.rules"
    install -D -m644 quartus-pro.desktop "${pkgdir}/usr/share/applications/quartus-pro.desktop"
}

package_quartus-pro-questa() {
    depends=(expat fontconfig freetype2 gcc-libs gd lib32-gcc-libs lib32-glibc lib32-libxml2
             libx11 libxext libxft libxml2 libxpm ncurses5-compat-libs zlib)
    pkgdesc="Quartus Prime Pro - Questa-Intel FPGA Starter Edition"
    license=('LicenseRef-QuestaSim')

    ./QuestaSetup-${_filver}-linux.run \
        --questa_edition questa_fse \
        --mode unattended \
        --accept_eula 1 \
        --installdir "${pkgdir}${_instdir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_instdir}/"{uninstall,logs}

    # Fix missing permissions
    find "${pkgdir}${_instdir}" \! -perm /o+rwx -exec chmod o=g {} +

    # Fix world writable permissions
    find "${pkgdir}${_instdir}/questa_fse/intel" -perm -o+w -exec chmod go-w {} +

    # Remove sticky bit from directories
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +

    # Replace altera directory in integration files
    sed -i "s,@_instdir@,${_instdir},g" questa-fse-pro.desktop

    # Add application icon
    install -D -m644 "${srcdir}/questa.gif" "${pkgdir}${_instdir}/questa_fse/questa.gif"

    # Suppress spurious warning about linux-gate.so.1
    #sed -i '/msg_system/a suppress = 3116' "${pkgdir}${_instdir}/questa_fse/modelsim.ini"

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_instdir}/questa_fse/EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m644 questa-fse-pro.desktop "${pkgdir}/usr/share/applications/questa-fse-pro.desktop"
}

package_quartus-pro-help() {
    depends=(quartus-pro-quartus)
    pkgdesc="Quartus Prime Pro - Help files"

    ./QuartusProHelpSetup-${_filver}-linux.run --mode unattended --accept_eula 1 --installdir "${pkgdir}${_instdir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_instdir}/"{uninstall,logs}

    # Remove sticky bit from directories
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_instdir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_quartus-pro-riscfree() {
    depends=(quartus-pro-quartus)
    pkgdesc="Quartus Prime Pro - RiscFree IDE for Altera"
    license=('LicenseRef-RiscFree')

    ./RiscFreeSetup-${_filver}-linux.run --mode unattended --accept_eula 1 --installdir "${pkgdir}${_instdir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_instdir}/"{uninstall,logs}

    # Remove sticky bit from directories
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +

    # Link license file
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${_instdir}/riscfree/licenses/license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# For some reason, this eval doesn't work reliably, and the eval needs to be executed twice
# for anything to work. Instead, I'm just going to write some boilerplate to save my sanity.
#for _dev in {agilex{3,5,7,_common},arria10,cyclone10gx,stratix10}; do
#    eval "
#package_${pkgbase}-devinfo-${_dev}() {
#   provides=(${pkgbase}-devinfo)
#   depends=( $([[ "${_dev}" =~ agilex[357] ]] && echo "${pkgbase}-devinfo-agilex_common") )
#   pkgdesc='Quartus Prime Pro - devinfo files for ${_dev}'
#   install -d \"\${pkgdir}\${_instdir}\"
#   bsdtar -xf \"${_dev}-\${_filver}.qdz\" -C \"\${pkgdir}\${_instdir}\"
#   find \"\${pkgdir}\${_instdir}\" -type d -exec chmod a-s {} +
#}
#"

package_quartus-pro-eda_cdclib() {
    depends=(quartus-pro-quartus)
    pkgdesc='Quartus Prime Pro - EDA CDC Libraries for Synopsys Spyglass'
    install -d "${pkgdir}${_instdir}"
    bsdtar -xf "eda_cdclib-${_filver}-linux.qdz" -C "${pkgdir}${_instdir}"
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +
}

# Can't package separately, some files are shared
package_quartus-pro-devinfo-agilex() {
    provides=(quartus-pro-devinfo)
    depends=()
    pkgdesc='Quartus Prime Pro - devinfo files for agilex3/5/7'
    install -d "${pkgdir}${_instdir}"
    bsdtar -xf "agilex3-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    bsdtar -xf "agilex5-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    bsdtar -xf "agilex7-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    bsdtar -xf "agilex_common-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +
}

package_quartus-pro-devinfo-arria10() {
    provides=(quartus-pro-devinfo)
    depends=()
    pkgdesc='Quartus Prime Pro - devinfo files for arria10'
    install -d "${pkgdir}${_instdir}"
    bsdtar -xf "arria10-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +
}

package_quartus-pro-devinfo-cyclone10gx() {
    provides=(quartus-pro-devinfo)
    depends=()
    pkgdesc='Quartus Prime Pro - devinfo files for cyclone10gx'
    install -d "${pkgdir}${_instdir}"
    bsdtar -xf "cyclone10gx-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +
}

package_quartus-pro-devinfo-stratix10() {
    provides=(quartus-pro-devinfo)
    depends=()
    pkgdesc='Quartus Prime Pro - devinfo files for stratix10'
    install -d "${pkgdir}${_instdir}"
    bsdtar -xf "stratix10-${_filver}.qdz" -C "${pkgdir}${_instdir}"
    find "${pkgdir}${_instdir}" -type d -exec chmod a-s {} +
}

# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

# Package name without suffix (-git, -bin, -whatever)
_pkgname=calcesara

DLAGENTS=('https::/usr/bin/curl -k -o %o %u')
pkgname="${_pkgname}"
pkgver=8.6.5
pkgrel=4
pkgdesc='Simulation Assisted Reliability Assessment (SARA) Software'
arch=('x86_64')
url='https://web.calce.umd.edu/software/releaseSARA'
license=('LicenseRef-calceSARA')
depends=(
    'wine' # Runs CalceSARA
    'bash' # Runs launch script
    'sed' # Templating
    'coreutils' # tail and printf are used in launch script for keygen
    'winetricks' # Installs fonts from launch script
)
#optdepends=('xdg-utils: for launching HTML help files')
#optdepends=(
    #'ttf-terminus'
    #'adobe-base-14-fonts: Helvetica and Times is widely used throught calceSARA.'
    #'ttf-dejavu: Mentioned in calceSARA license, so we can assume it's used somewhere.'
#) # TODO!
makedepends=(
    'curl' # Downloads sources
	'imagemagick' # Convert icons to png
	'gendesk' # Generate desktop entries
    'sed' # Templating
    '7zip' # Unzip installer binary
)

# Template for launch script.
_launcher_template="${_pkgname}.sh.template"
_launcher_check="${_pkgname}.sh"

# Keyfile-name
_keyfile_name='calce.key'

# Keygen template
_keygen_template="${_keyfile_name}.template"

# Install location folder name.
_exe_name="calceSARAv${pkgver}"

# Installer filename.
_installer_exe="install_${_exe_name}.exe"

# License file unpacked from installer exe
_license_file='calcelicense.txt'

source=(
    "${_keygen_template}"
    "${_launcher_template}"
    "https://web.calce.umd.edu/software/releaseSARA/${pkgver}/${_installer_exe}"
)
sha256sums=(
    826670642a9eba219d64063510a8ca33da4a8f2b53717e22c80796bf877e0885
    1455d3c311132dd9eeaf79cbff10c8c16de13e32cd8acb75d238a86004af8d3c
    3b1c416c75f545d247ddbecc5e85678156d66f8040247ba1d129795e19a3b088
)

#OPTIONS=(!strip) # No need!

# Found in DecryptInputStream and EncryptOutputStream in calce source code.
# Required for keygens because CALCE's official keys are unreliable when running CalceSARA under wine.
_keygen_cryptkey=0xD4

# Runner CLI options.
# Each option corresponds to a different CalceSARA application.
_options=(
    'fast'
    'tce|tcextractor'
    'docs'
    'pwa'
    'wr|whiskerrisk'
    'updates'
)

# Shortcut names of start-menu entries.
# These are needed to launch the different applcations.
# Each program is launched from its start-menu shortcut, so these are important.
_lnks=(
    'calceFAST'
    'calceTCExtractor'
    'User Documentation'
    'calcePWA'
    'calceWhiskerRisk'
    'Updates'
)

# Shared application data will be stored in /opt
# I think that's ok.
_shared_data_prefix='/opt'
_shared_data_location=${_shared_data_prefix}/${_pkgname}

prepare() {
    cd "${srcdir}"

    # Text replacement on launcher template
    __option_cases=""
    __options_help_list=""
    for i in ${!_lnks[@]}; do
        __option=${_options[i]}
        __lnk=${_lnks[i]}
        __option_cases="${__option_cases}\n\t${__option}) lnk=${__lnk};;"
        __option_help_list="${__option_help_list}\\n\\t- ${__option}"
    done
    sed -i "s/@keygen_cryptkey@/${_keygen_cryptkey}/g" ${_launcher_template}
    sed -i "s/@pkgver@/${pkgver}/g" ${_launcher_template}
    sed -i "s/@pkgname@/${_pkgname}/g" ${_launcher_template}
    sed -i "s/@exe_name@/${_exe_name}/g" ${_launcher_template}
    sed -i "s/@keyfile_name@/${_keyfile_name}/g" ${_launcher_template}
    sed -i "s#@shared_data_prefix@#${_shared_data_prefix}#g" ${_launcher_template}
    sed -i "s/@option_help_list@/${__option_help_list}/g" ${_launcher_template}
    sed -i "s/@option_cases@/${__option_cases}/g" ${_launcher_template}

    cp ${_launcher_template} ${_launcher_check}
    sed -i "s/#@check@/# Good to go!/g" ${_launcher_template}
    sed -i "s/#@check@/exit 0/g" ${_launcher_check}
    
    # Extracts installer to obtain icon files for desktop entries.
    7z e ${_installer_exe} -y
}

# Desktop entry metadata
_desk_names=(
    'calceFAST'
    'calceTCExtractor'
    'calceSARA User Documentation'
    'calcePWA'
    'calceWhiskerRisk'
    'calceSARA Updates'
)
_desk_generic_names=(
    'Failure Assessment Toolkit'
    'Temperature Cycle Extraction Module'
    'User Documentation'
    'Physical Wiring Assembly Toolbox'
    'Whisker Risk Calculator'
    'Updater'
)
_desk_comments=(
    'Failure Assessment Toolkit'
    'Temperature Cycle Extraction Module'
    'Documentation for calceSARA'
    'Physical Wiring Assembly Toolbox'
    'Whisker Risk Calculator'
    'Update and validate calceSARA'
)

build() {
    cd "${srcdir}"

    # Generate desktop entries
    for i in ${!_lnks[@]}; do
        __lnk=${_lnks[i]}
        __desk_name=${_desk_names[i]}
        __desk_generic_name=${_desk_generic_names[i]}
        __desk_comment=${_desk_comments[i]}
        __option="$(echo ${_options[i]} | sed 's/|.*//g')" # Strip aliases

        # Convert icon to png
        magick "${__lnk}.ico" "${__desk_name}.png"
        rm "${__lnk}.ico"

        # Generate desktop entry
        gendesk --pkgname "${_pkgname}" --pkgdesc "${__pkgdesc}" -n --name="${__desk_name}" --genericname="${__desk_generic_name}" --comment="${__desk_comment}" --icon="${__desk_name}" --terminal=false --exec="/usr/bin/${_pkgname} ${__option}" -f
        mv "${_pkgname}.desktop" "${_pkgname}-${__lnk}.desktop"
    done
}

check()
{
    cd "${srcdir}"

    bash ${srcdir}/${_launcher_check}
}

package()
{
    cd "${srcdir}"

    # Install License
    install -Dm644 "${srcdir}/${_license_file}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Install Desktop files
    for i in ${!_lnks[@]}; do
        __lnk=${_lnks[i]}
        __desk_name=${_desk_names[i]}

        install -Dm644 "${srcdir}/${__desk_name}.png" "${pkgdir}/usr/share/pixmaps/${__desk_name}.png"
        install -Dm644 "${srcdir}/${_pkgname}-${__lnk}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-${__lnk}.desktop"
    done

    # Docs are in the wine-bottle. (for now... not ideal)
    # Install docs to /usr/share/doc/
    #install -m755 -d "${pkgdir}/usr/share/doc/${_pkgname}"
    #cp -r calceSARAHelp/* "${pkgdir}/usr/share/doc/${_pkgname}"

    # Install shared files to /opt/
    install -Dm755 -d "${pkgdir}${_shared_data_location}"
    install -Dm644 "${srcdir}/${_keygen_template}" "${pkgdir}${_shared_data_location}/${_keyfile_name}.template"
    install -Dm644 "${srcdir}/${_installer_exe}" "${pkgdir}${_shared_data_location}/install_${_exe_name}.exe"
    
    # N/A
    #install -m644 ChangeLog.txt "${pkgdir}/opt/${_pkgname}"

    # symlink help files
    #ln -sv "/usr/share/doc/${_pkgname}" "${pkgdir}/opt/${_pkgname}/calceSARAHelp"

    # Install launch script
    install -Dm755 "${srcdir}/${_launcher_template}" "${pkgdir}/usr/bin/${_pkgname}"
}


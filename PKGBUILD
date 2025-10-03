# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>
# Authors: Prof. Michael Pecht, Dr. Michael Osterman
# Contributors: Prof. Abhijit Dasgutpa, Prof. Donald Barker, David Eisner
#
# ##############################################################################################
#
# Thank you for your interest in the calceSARA Software.
#
# Copyright:
# Copyright (c) 1987,2020 CALCE and the University of Maryland
# All Rights Reserved
# 
# License:
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# 
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# Liability:
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# Contact:
# 
# CALCE, University of Maryland, College Park, MD 20742
# calce-software@umd.edu

# Package name without suffix (-git, -bin, -whatever)
_pkgname=calcesara

DLAGENTS=('https::/usr/bin/curl -k -o %o %u')
pkgname="${_pkgname}"
pkgver=8.6.5
pkgrel=13
pkgdesc='Simulation Assisted Reliability Assessment (SARA) Software'
arch=('any')
url='https://web.calce.umd.edu/software/releaseSARA'
license=('LicenseRef-calceSARA')
depends=(
    'wine' # Runs CalceSARA
    'wine-mono' # .NET framework
    'bash' # Runs launch script
    'sed' # Templating
    'coreutils' # tail and printf are used in launch script for keygen
)
optdepends=(
    'winetricks: Installs microsoft fonts locally if missing from system'
    'ttf-ms-win10-auto: Microsoft fonts'
    'ttf-liberation: Serif and sans-serif fonts'
    'ttf-dejavu: Serif and sans-serif fonts'
)
makedepends=(
    'curl' # Downloads sources
	'imagemagick' # Convert icons to png
	'gendesk' # Generate desktop entries
    '7zip' # Unzip installer binary
)

# Keyfile-name
_keyfile_name='calce.key'

# Keygen template
_keygen_template="${_keyfile_name}.template"

# Install location folder name.
_exe_name="calceSARAv${pkgver}"

# Installer filename.
_installer_exe="install_${_exe_name}.exe"

source=(
    "${_keyfile_name}.template"
    "${_pkgname}.sh.template"
    "https://web.calce.umd.edu/software/releaseSARA/${pkgver}/${_installer_exe}"
)
sha256sums=(
    826670642a9eba219d64063510a8ca33da4a8f2b53717e22c80796bf877e0885
    f64901f5f5df3bf613b1bf143602380a52469c2a36723b7c5ff6ea95260bca1b
    3b1c416c75f545d247ddbecc5e85678156d66f8040247ba1d129795e19a3b088
)

# If you don't have these font, most text will just render as boxes.
# Fonts that are missing from your system will be installed locally in the wine-bottle by winetricks if you have winetricks installed.
# See optdepends for relevant packages
_fonts=(
    'arial' # Most important one. Provided by msfonts
    'arialbd=arial' # Most important one. Provided by msfonts
    'ariali=arial' # Most important one. Provided by msfonts
    'arialbi=arial' # Most important one. Provided by msfonts

    'times' # Provided by msfonts
    'timesbd=times' # Provided by msfonts
    'timesi=times' # Provided by msfonts
    'timesbi=times' # Provided by msfonts
    
    'tahoma' # Provided by msfonts
    'tahomabd=tahoma' # Provided by msfonts

    'DejaVuSerif|LiberationSerif-Regular=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSerif-Bold|LiberationSerif-Bold=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSerif-Italic|LiberationSerif-Italic=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSerif-BoldItalic|LiberationSerif-BoldItalic=liberation' # Provided by ttf-dejavu or ttf-liberation

    'DejaVuSans|LiberationSans-Regular=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSans-Bold|LiberationSans-Bold=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSans-Oblique|LiberationSans-Italic=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSans-BoldOblique|LiberationSans-BoldItalic=liberation' # Provided by ttf-dejavu or ttf-liberation

    'DejaVuSansMono|LiberationMono-Regular=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSansMono-Bold|LiberationMono-Bold=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSansMono-Oblique|LiberationMono-Italic=liberation' # Provided by ttf-dejavu or ttf-liberation
    'DejaVuSansMono-BoldOblique|LiberationMono-BoldItalic=liberation' # Provided by ttf-dejavu or ttf-liberation
)

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
    local __option_cases=""
    local __options_help_list=""
    for i in ${!_lnks[@]}; do
        local __option="${_options[i]}"
        local __lnk="${_lnks[i]}"
        __option_cases="${__option_cases}\n\t${__option}) lnk=${__lnk};;"
        __option_help_list="${__option_help_list}\\n\\t- ${__option}"
    done
    local __fonts=""
    for i in ${_fonts[@]}; do
        __fonts+="\n\t\'${i}\'"
    done
    sed -i "s/@keygen_cryptkey@/${_keygen_cryptkey}/g" "${_pkgname}.sh.template"
    sed -i "s/@pkgver@/${pkgver}/g" "${_pkgname}.sh.template"
    sed -i "s/@pkgname@/${_pkgname}/g" "${_pkgname}.sh.template"
    sed -i "s/@exe_name@/${_exe_name}/g" "${_pkgname}.sh.template"
    sed -i "s/@keyfile_name@/${_keyfile_name}/g" "${_pkgname}.sh.template"
    sed -i "s#@shared_data_prefix@#${_shared_data_prefix}#g" "${_pkgname}.sh.template"
    sed -i "s/@option_help_list@/${__option_help_list}/g" "${_pkgname}.sh.template"
    sed -i "s/@option_cases@/${__option_cases}/g" "${_pkgname}.sh.template"
    sed -i "s/@fonts@/${__fonts}/g" "${_pkgname}.sh.template"

    cp "${_pkgname}.sh.template" "${_pkgname}.sh"
    sed -i "s/#@check@/# Good to go!/g" "${_pkgname}.sh.template"
    sed -i "s/#@check@/exit 0/g" "${_pkgname}.sh"
    
    # Extracts installer to obtain icon files for desktop entries.
    7z e "${_installer_exe}" -y
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

build() {
    cd "${srcdir}"

    local _desk_generic_names=(
        'Failure Assessment Toolkit'
        'Temperature Cycle Extraction Module'
        'User Documentation'
        'Physical Wiring Assembly Toolbox'
        'Whisker Risk Calculator'
        'Updater'
    )
    local _desk_comments=(
        'Failure Assessment Toolkit'
        'Temperature Cycle Extraction Module'
        'Documentation for calceSARA'
        'Physical Wiring Assembly Toolbox'
        'Whisker Risk Calculator'
        'Update and validate calceSARA'
    )

    # Generate desktop entries
    for i in ${!_lnks[@]}; do
        local __lnk="${_lnks[i]}"
        local __desk_name="${_desk_names[i]}"
        local __desk_generic_name="${_desk_generic_names[i]}"
        local __desk_comment="${_desk_comments[i]}"
        local __option="$(echo ${_options[i]} | sed 's/|.*//g')" # Strip aliases

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

    bash "${srcdir}/${_pkgname}.sh"
}

package()
{
    cd "${srcdir}"

    # Install License
    install -Dm644 "${srcdir}/calcelicense.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Install Desktop files
    for i in ${!_lnks[@]}; do
        local __lnk="${_lnks[i]}"
        local __desk_name="${_desk_names[i]}"

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
    install -Dm755 "${srcdir}/${_pkgname}.sh.template" "${pkgdir}/usr/bin/${_pkgname}"
}


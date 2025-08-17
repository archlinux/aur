# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

_parts=(
    'calceFAST'
    'calceTCExtractor'
    'User Documentation'
    'calcePWA'
    'calceWhiskerRisk'
    'Updates'
)
_part_names=(
    'calceFAST'
    'calceTCExtractor'
    'calceSARA User Documentation'
    'calcePWA'
    'calceWhiskerRisk'
    'calceSARA Updates'
)
_part_generic_names=(
    'Failure Assessment Toolkit'
    'Temperature Cycle Extraction Module'
    'User Documentation'
    'Physical Wiring Assembly Toolbox'
    'Whisker Risk Calculator'
    'Updater'
)
_part_comments=(
    'Failure Assessment Toolkit'
    'Temperature Cycle Extraction Module'
    'Documentation for calceSARA'
    'Physical Wiring Assembly Toolbox'
    'Whisker Risk Calculator'
    'Update and validate calceSARA'
)
_options=(
    fast
    tce
    docs
    pwa
    wr
    updates
)
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=calcesara
pkgver=8.6.5
pkgrel=2
pkgdesc="Simulation Assisted Reliability Assessment (SARA) Software"
arch=('x86_64')
url="https://web.calce.umd.edu/software/releaseSARA"
license=('LicenseRef-calceSARA')
depends=('wine' 'bash')
#optdepends=('xdg-utils: for launching HTML help files')
makedepends=(
    'curl'
	'imagemagick'
	'gendesk'
    'sed'
    '7zip'
    'winetricks'
)

source=(
    "${pkgname}.sh"
    "https://web.calce.umd.edu/software/releaseSARA/${pkgver}/install_calceSARAv${pkgver}.exe"
)
sha256sums=(
    9f4ae510895f3fa4d1bc0e206b333e1ca8277c377e1e516c36f006947ea878ec
    3b1c416c75f545d247ddbecc5e85678156d66f8040247ba1d129795e19a3b088
)

OPTIONS=(!strip)

prepare() {
    cd "${srcdir}"

    sed -i "s/@pkgver@/${pkgver}/g" ${pkgname}.sh

    7z e install_calceSARAv${pkgver}.exe -y
}

build() {
    cd "${srcdir}"

    for i in ${!_parts[@]}; do
        part=${_parts[i]}
        part_name=${_part_names[i]}
        part_generic_name=${_part_generic_names[i]}
        part_comment=${_part_comments[i]}
        option=${_options[i]}

        magick "$part.ico" "$part_name.png"
        rm "$part.ico"

        gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" -n --name="$part_name" --genericname="$part_generic_name" --comment="$part_comment" --icon="$part_name" --terminal=false --exec="/usr/bin/calcesara $option" -f
        mv "${pkgname}.desktop" "${pkgname}-$part.desktop"
    done
}

package()
{
    cd "${srcdir}"

    # Install License
    install -Dm644 calcelicense.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install Desktop files
    for i in ${!_parts[@]}; do
        part=${_parts[i]}
        part_name=${_part_names[i]}

        install -Dm644 "$part_name.png" "${pkgdir}/usr/share/pixmaps/$part_name.png"
        install -Dm644 "${pkgname}-$part.desktop" "${pkgdir}/usr/share/applications/${pkgname}-$part.desktop"
    done

    # Install docs to /usr/share/doc/
    #install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    #cp -r calceSARAHelp/* "${pkgdir}/usr/share/doc/${pkgname}"

    # Install binary files to /opt
    install -m755 -d "${pkgdir}/opt/${pkgname}"
    install -m755 install_calceSARAv${pkgver}.exe "${pkgdir}/opt/${pkgname}"
    #install -m644 ChangeLog.txt "${pkgdir}/opt/${pkgname}"

    # symlink help files
    #ln -sv "/usr/share/doc/${pkgname}" "${pkgdir}/opt/${pkgname}/calceSARAHelp"

    # Install /usr/bin startscript
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}


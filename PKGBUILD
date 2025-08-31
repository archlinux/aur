# Maintainer: fenugrec <fenugrec users sourceforge net>
# Contributor: Max Stabel <max dot stabel03 at gmail dot com>

# So, versioning is a bit of a mess now. Maybe it will improve over time.
# - there are permalinks, like https://ltspice.analog.com/download/24.1.0/LTspice64.msi
# - the above is the same file as what you currently (2025/01/25) get from https://ltspice.analog.com/software/LTspice64.msi
# - 'LTspice.json' contains version string '24.0.12' (wasn't updated ?), but the .exe shows the expected 24.1.0 
# - if you download https://ltspice.analog.com/download/24.0.12/LTspice64.msi, you get a file that self-describes as 24.0.11...
# - it would be possible to process the .exe to extract a version string but I don't see the point.

pkgname=ltspice
pkgver=24.1.9.1
pkgrel=1
pkgdesc="SPICE simulator, schematic capture and waveform viewer."
arch=('x86_64')
url="https://www.analog.com/en/resources/design-tools-and-calculators/ltspice-simulator.html"
license=('LicenseRef-LTspice')
depends=('wine')
optdepends=('xdg-utils: for launching HTML help files')
makedepends=('gawk'
	'curl'
	'icoutils'
	'imagemagick'
	'gendesk'
	'msitools'
)

source=("${pkgname}.sh"
        "${pkgname}-help.sh"
	"conv.sh"
	"LTspice64-${pkgver}.msi::https://LTspice.analog.com/download/24.1.9/LTspice64.msi"
	)

installer_sha256='AF93F7916FE70CDF7D99B4E4943AE67A0737C1F2286AD9900BC1DE028A1E987F'

sha256sums=('456c0e6550f8d7ee354aca18f9d421be023b6bcb6afe80d9e8bc558b7d8961a6'
            '3a0fed134c263a7a0573f36c1f4e49d27bea2cca0c098e069e79e1411d3c302e'
            '9d1eb3d868376960050469324f8c7e7fbf674bfcbcac76c2a10934dbe77f6b6c'
	    ${installer_sha256}
    )

OPTIONS=(!strip)

prepare() {
    cd "${srcdir}"

    msiextract LTspice64-${pkgver}.msi
    mv -f "APPDIR:."/* .
    mv -f "LocalAppDataFolder/LTspice"/* .
}

build() {
    cd "${srcdir}"

    wrestool -x -t 14 LTspice.exe >${pkgname}.ico
    magick ${pkgname}.ico ${pkgname}.png
    rm ${pkgname}.ico

    gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" -n --name="LTSpice" --exec="/usr/bin/ltspice" -f

    #tweak mixed-case hyperlinks in help docs
    cd LTspiceHelp
    echo '==> Adjusting help files'
    sh ../conv.sh
}

package()
{
    cd "${srcdir}"

    # Install License
    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install Desktop file
    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install docs to /usr/share/doc/
    install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r LTspiceHelp/* "${pkgdir}/usr/share/doc/${pkgname}"

    # Install binary files to /opt
    install -m755 -d "${pkgdir}/opt/${pkgname}"
    install -m755 *.exe "${pkgdir}/opt/${pkgname}"
    install -m644 *.zip "${pkgdir}/opt/${pkgname}"
    install -m644 LTspice.json "${pkgdir}/opt/${pkgname}"
    install -m644 ChangeLog.txt "${pkgdir}/opt/${pkgname}"

    # symlink help files
    ln -sv "/usr/share/doc/${pkgname}" "${pkgdir}/opt/${pkgname}/LTspiceHelp"

    # Install /usr/bin startscript
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-help.sh" "${pkgdir}/usr/bin/${pkgname}-help"
}


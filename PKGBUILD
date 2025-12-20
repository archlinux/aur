# Maintainer: fenugrec <fenugrec users sourceforge net>
# Contributor: Max Stabel <max dot stabel03 at gmail dot com>

# So, versioning is a bit of a mess now. Maybe it will improve over time.
# - we have a 'maintainer.sh' script to automate version bumping, that retrieves an 'udpate.txt' file from Analog
# - there are permalinks, like https://ltspice.analog.com/download/24.1.0/LTspice64.msi
# - the generic URL https://ltspice.analog.com/software/LTspice64.msi links to the 'latest' version
# - 'LTspice.json' contains version string '24.0.12' (wasn't updated ?), but the .exe shows the expected 24.1.0 
# - if you download https://ltspice.analog.com/download/24.0.12/LTspice64.msi, you get a file that self-describes as 24.0.11...
# - it would be possible to process the .exe to extract a version string but I don't see the point.

pkgname=ltspice
pkgver=26.0.1.0
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
	'msitools'
)

source=("${pkgname}.sh"
        "${pkgname}-help.sh"
	"conv.sh"
	"ltspice.desktop"
	"LTspice64-${pkgver}.msi::https://LTspice.analog.com/download/26.0.1/LTspice64.msi"
	)

installer_sha256='EC35026697ED32D2AE57B17BE3A3C8877B631F642B66326491A9808C47EC0081'

sha256sums=('78f50fd44506093849421ec3c05516eba1d850160192175c4e7db4811df40f1c'
            '3a0fed134c263a7a0573f36c1f4e49d27bea2cca0c098e069e79e1411d3c302e'
            '9d1eb3d868376960050469324f8c7e7fbf674bfcbcac76c2a10934dbe77f6b6c'
            'a8b97e57c3fc33b856d45d8e93f38a84f825938dc461a40957ea0f56464d21ee'
            ${installer_sha256}
    )

options=(!strip)

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

    # Install docs
    install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r LTspiceHelp/* "${pkgdir}/usr/share/doc/${pkgname}"

    # Install program files, following
    # https://wiki.archlinux.org/title/Wine_package_guidelines
    bin_destdir="${pkgdir}/usr/share/${pkgname}"
    install -m755 -d "${bin_destdir}"
    install -m755 *.exe "${bin_destdir}"
    install -m644 *.zip "${bin_destdir}"
    install -m644 LTspice.json "${bin_destdir}"
    install -m644 ChangeLog.txt "${bin_destdir}"

    # symlink help files
    ln -sv "/usr/share/doc/${pkgname}" "${bin_destdir}/LTspiceHelp"

    # Install /usr/bin startscript
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-help.sh" "${pkgdir}/usr/bin/${pkgname}-help"
}


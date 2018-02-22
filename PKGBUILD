# Submitter: Zesen Qian <quartus at riaqn dot org>
# Maintainer Sequencer <liujiuyang1994 at gmail dot com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# NOTE: Altera has dramatically changed their packing in regards to version 12. This
#       PKGBUILD will install the full Altera suite now. Be aware that the space requirement
#       is around 13GB.
#
pkgname=quartus-standard
pkgver=17.1.1.593
_oldver=17.1.0.590
pkgrel=1
pkgdesc="Quartus Prime Standard Edition design software for Altera FPGA's. Modular package"
arch=('i686' 'x86_64')
url="http://dl.altera.com/?edition=standard"
license=('custom')

_alteradir="/opt/altera"

depends=('desktop-file-utils' 'expat' 'fontconfig' 'freetype2'
'glibc' 'gtk2' 'libcanberra' 'libpng' 'libpng12' 'libice' 'libsm'
'util-linux' 'ncurses' 'tcl' 'tcllib' 'zlib' 'libx11' 'libxau'
'libxdmcp' 'libxext' 'libxft' 'libxrender' 'libxt' 'libxtst')

source=("http://download.altera.com/akdlm/software/acdsinst/17.1std.1/593/update/QuartusSetup-${pkgver}-linux.run"
        "http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_installers/QuartusSetup-${_oldver}-linux.run"
        "QuartusWrapper-${pkgver}-linux.run"
        "quartus.sh"
        "quartus.desktop"
        "51-usbblaster.rules"
        "quartus.install")
sha256sums=('5a6a98b61b054bb2116be36afd53aa67e67684a0017adfca0e1a9b96ef0069da'
            '2f05a82bc996a9fa160f4dc42ea9afd047d7b1535589e4687681a611319eb44d'
            'cdaacc5198bb3af03cdf831c4734effa6ae0eac6f14971388a808ce701db1c26'    
            '849dd042a6173bb4f97a9522b51935bd3069a3313fe963ae19dcf4c25331b291'
            'eade659fda0db843a5b287502415c698c4f251f3b721836e2a56911896fc2371'
            'dd9d33fa2698a0ec11ae86f4508f77e2e12bf4a21224f5b16640bc41d6c0999b'
            '0e815b138bcec2d1f9c6aa498d2f56cc131417119af19016a2019173da526d9b')

options=(!strip !upx) # Stripping and UPX will takes ages, I'd avoid it.
install='quartus.install'
PKGEXT=".pkg.tar" # Do not compress

package() {
    cd "${srcdir}"

    chmod a+x "QuartusSetup-${_oldver}-linux.run"
    chmod a+x "QuartusSetup-${pkgver}-linux.run"
    chmod a+x "QuartusWrapper-${pkgver}-linux.run"

    # switch two files
    mv "QuartusSetup-${pkgver}-linux.run" "temp"
    mv "QuartusWrapper-${pkgver}-linux.run" "QuartusSetup-${pkgver}-linux.run"
    mv "temp" "QuartusWrapper-${pkgver}-linux.run"

    DISPLAY="" ./"QuartusSetup-${_oldver}-linux.run" --accept_eula 1 --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}" &>/dev/null & 
    
    while [ ! -d "${pkgdir}${_alteradir}/logs" ]; do
        sleep 10
    done
    killall QuartusSetup-${_oldver}-linux.run
    
    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    # Replace altera directory in integration files
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop

    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgnam}/license.txt"

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
}

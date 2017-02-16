# Maintainer: Matthias Blaicher <matthias at blaicher dot com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# NOTE: Altera has dramatically changed their packing in regards to version 12. This
#       PKGBUILD will install the full Altera suite now. Be aware that the space requirement
#       is around 13GB.
#
pkgname=quartus-standard
pkgver=16.1.0.196
pkgrel=1
pkgdesc="Quartus Prime Standard Edition design software for Altera FPGA's. Modular package"
arch=('i686' 'x86_64')
url="http://dl.altera.com/?edition=standard"
license=('custom')

_build_nr="${pkgver##*.}"
_alteradir="/opt/altera"

# According to the installer script, these dependencies are needed for the installer
if [[ $CARCH = i686 ]]
then
   depends=('desktop-file-utils' 'expat' 'fontconfig' 'freetype2'
   'glibc' 'gtk2' 'libcanberra' 'libpng' 'libpng12' 'libice' 'libsm'
   'util-linux' 'ncurses' 'tcl' 'tcllib' 'zlib' 'libx11' 'libxau'
   'libxdmcp' 'libxext' 'libxft' 'libxrender' 'libxt' 'libxtst')
fi

if [[ $CARCH = x86_64 ]]
then
   depends=('desktop-file-utils' 'expat' 'fontconfig' 'freetype2'
   'glibc' 'gtk2' 'libcanberra' 'libpng' 'libpng12' 'libice' 'libsm'
   'util-linux' 'ncurses' 'tcl' 'tcllib' 'zlib' 'libx11' 'libxau'
   'libxdmcp' 'libxext' 'libxft' 'libxrender' 'libxt' 'libxtst'

   'lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-glibc'
   'lib32-gtk2' 'lib32-libcanberra' 'lib32-libpng' 'lib32-libpng12'
   'lib32-libice' 'lib32-libsm' 'lib32-util-linux' 'lib32-ncurses'
   'lib32-zlib' 'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp'
   'lib32-libxext' 'lib32-libxft' 'lib32-libxrender' 'lib32-libxt'
   'lib32-libxtst')
fi

makedepends=('bash' 'upx')

optdepends=('quartus-max: MAXII, MAXV device support'
            'quartus-max10: MAX10 device support'
            'quartus-cyclone: Cyclone IV device support'
            'quartus-cyclonev: Cyclone V device support'
            'quartus-arria: Arria II device support'
            'quartus-modelsim: ModelSim-Altera Edition'
           )
           # Pkgnames are taken directly from altera downloads file names

source=("http://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}/${_build_nr}/ib_installers/QuartusSetup-${pkgver}-linux.run"
	"quartus.sh" "quartus.desktop" "51-usbblaster.rules" "quartus.install")
md5sums=('0ff8c051c26f7b4c15bf5d203efae13e'
         '067c444cae7fe31d3608245712b43ce8'
         '32b17cb8b992fc2dccd33d87f0dcd8ce'
         'f5744dc4820725b93917e3a24df13da9'
         'a331a81c44aed062a7af6d28542c3d82')

options=('strip' 'upx') # Stripping and UPX will takes ages, I'd avoid it.
install='quartus.install'
PKGEXT=".pkg.tar" # Do not compress

package() {
    cd "${srcdir}"

    # TODO: Make bogus $DISPLAY
    chmod a+x "QuartusSetup-${pkgver}-linux.run"
    DISPLAY="" ./"QuartusSetup-${pkgver}-linux.run" --mode unattended --unattendedmodeui none --installdir "${pkgdir}/${_alteradir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    # Remove for now parts that are not needed for core quartus:
    # TODO: Split instead of removing

    # Nios2Eds - no comments on this abomination
    rm -rf ${pkgdir}/${_alteradir}/nios2eds

    # Altera IP cores - you probably don't want to use them anyway (see opencores)
    rm -rf ${pkgdir}/${_alteradir}/ip

    # HLS (HLD) - high level synthesis
    rm -rf ${pkgdir}/${_alteradir}/hld

    # Help (Nearly 1GiB)
    #rm -rf ${pkgdir}/${_alteradir}/quartus/common/help

    # Replace altera directory in integration files
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop

    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
}

# vim:set ts=2 sw=2 et:

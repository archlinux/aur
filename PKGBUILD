# Maintainer: Matthias Blaicher <matthias at blaicher dot com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# NOTE: Altera has dramatically changed their packing in regards to version 12. This
#       PKGBUILD will install the full Altera suite now. Be aware that the space requirement
#       is around 13GB.
#
pkgname=quartus-free
pkgver=15.0.0.145
pkgrel=2
pkgdesc="Quartus II Web Edition design software for Altera FPGA's"
arch=('i686' 'x86_64')
url="https://dl.altera.com/?edition=web"
license=('custom')

_build_nr=$(echo ${pkgver} | cut -d '.' -f4)
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

makedepends=('bash')

source=("http://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}/${_build_nr}/ib_tar/Quartus-web-${pkgver}-linux.tar"
        "http://seblu.net/a/arm/2013/10/11/multilib/os/x86_64/lib32-freetype2-2.5.0.1-1-x86_64.pkg.tar.xz"   # Used for a freetype bugfix HACK
	"quartus.sh" "quartus.desktop" "51-usbblaster.rules" "quartus.install" "modelsim-ase.desktop")
md5sums=('6bbe995747baf100d7f5bc04246971d7'
         'd3b3b7cdf874b6dd0b60c40d84dd9128'
         '067c444cae7fe31d3608245712b43ce8'
         '32b17cb8b992fc2dccd33d87f0dcd8ce'
         'f5744dc4820725b93917e3a24df13da9'
         'a331a81c44aed062a7af6d28542c3d82'
         'bb11a542139ea8ded899ea42588ec0f7')

options=('!strip' '!upx') # Stripping and UPX will takes ages, I'd avoid it.
install='quartus.install'
PKGEXT=".pkg.tar"

package() {
    cd "${srcdir}"
    
    DISPLAY="" bash ./setup.sh --mode unattended --unattendedmodeui none --installdir "${pkgdir}/${_alteradir}"
    
    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"
    
    # Replace altera directory in integration files
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop
    sed -i.bak "s,_alteradir,$_alteradir,g" modelsim-ase.desktop
    
    # Fix modelsim startup code for Linux Kernel 4.0
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software
    sed -i.bak "s,linux_rh60,linux,g" "${pkgdir}${_alteradir}/modelsim_ase/vco"
    sed -i.bak "s,linux_rh60,linux,g" "${pkgdir}${_alteradir}/modelsim_ae/vco"

    # Modelsim requires old freetype libraries...
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software#With_freetype2_2.5.0.1-1
    sed -i.bak2 "10s,^,export LD_LIBRARY_PATH=${_alteradir}/modelsim_ase/lib \n,g" "${pkgdir}${_alteradir}/modelsim_ase/vco"
    sed -i.bak2 "10s,^,export LD_LIBRARY_PATH=${_alteradir}/modelsim_ase/lib \n,g" "${pkgdir}${_alteradir}/modelsim_ase/vco"
    install -D -m755 usr/lib32/libfreetype.so* "${pkgdir}${_alteradir}/modelsim_ae/lib"
    install -D -m755 usr/lib32/libfreetype.so* "${pkgdir}${_alteradir}/modelsim_ase/lib"
    
    
    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
    install -D -m644 modelsim-ase.desktop "${pkgdir}/usr/share/applications/modelsim-ase.desktop"
}

# vim:set ts=2 sw=2 et:
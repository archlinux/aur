# Maintainer: Matthias Blaicher <matthias at blaicher dot com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# NOTE: Altera has dramatically changed their packing in regards to version 12. This
#       PKGBUILD will install the full Altera suite now. Be aware that the space requirement
#       is around 13GB.
#
pkgname=quartus-free
pkgver=15.0.0.145
pkgrel=1
pkgdesc="Quartus II Web Edition design software for Altera FPGA's"
arch=('i686' 'x86_64')
url="https://dl.altera.com/?edition=web"
license=('custom')

_build_nr=$(echo ${pkgver} | cut -d '.' -f4)
_alteradir="/opt/altera"

# According to the installer script, these dependencies are needed for the installer
if [[ $CARCH = i686 ]]
then
   depends=('desktop-file-utils' 'glibc' 'libxext' 'libx11' 'libxau' 'libxdmcp' 'freetype2' 
		        'fontconfig' 'expat' 'libpng12')
   optdepends=('gtk: For eclipse-nios2 support'
               'libxtst: For eclipse-nios2 support')
fi

if [[ $CARCH = x86_64 ]]
then
   depends=('desktop-file-utils' 'lib32-glibc' 'lib32-libxext' 'lib32-libx11' 
	    'lib32-libxau' 'lib32-libxdmcp' 'lib32-freetype2'
	    'lib32-fontconfig' 'lib32-expat' 'lib32-libpng12' 
	    'lib32-libxrender' 'lib32-libsm')
   optdepends=('lib32-gtk: For eclipse-nios2 support'
               'lib32-libxtst: For eclipse-nios2 support')
fi

makedepends=('bash')

source=("http://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}/${_build_nr}/ib_tar/Quartus-web-${pkgver}-linux.tar"
	"quartus.sh" "quartus.desktop" "51-usbblaster.rules" "quartus.install")
md5sums=('6bbe995747baf100d7f5bc04246971d7'
         '067c444cae7fe31d3608245712b43ce8'
         '32b17cb8b992fc2dccd33d87f0dcd8ce'
         'f5744dc4820725b93917e3a24df13da9'
         'a331a81c44aed062a7af6d28542c3d82')

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
    
    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
}

# vim:set ts=2 sw=2 et:
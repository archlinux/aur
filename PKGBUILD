# Maintainer: Matthias Blaicher <matthias at blaicher dot com>
# Co-Maintainer: Danny Dutton <duttondj@vt.edu>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# NOTE: Altera has dramatically changed their packing in regards to version 12. This
#       PKGBUILD will install the full Altera suite now. Be aware that the space requirement
#       for installation is around 14GB but packaging may require up to 54GB of space.
#
pkgname=quartus-free
pkgver=16.0.0.211
pkgrel=2
pkgdesc="Quartus Prime Lite Edition design software for Altera FPGA's"
arch=('i686' 'x86_64')
url="https://dl.altera.com/?edition=lite"
license=('custom')

_build_nr=$(echo ${pkgver} | cut -d '.' -f4)
_alteradir="/opt/altera/${pkgver%.*.*}"

# Change this to "ae" if using ModelSim Subscription Edition
_modelsimver="ase"

# According to the installer script, these dependencies are needed for the installer
if [[ $CARCH = i686 ]]
then
   depends=('desktop-file-utils' 'expat' 'fontconfig' 'freetype2' 
   'glibc' 'gtk2' 'libcanberra' 'libpng' 'libpng12' 'libice' 'libsm' 
   'util-linux' 'ncurses' 'ncurses5-compat-libs' 'tcl' 'tcllib'
   'zlib' 'libx11' 'libxau' 'libxdmcp' 'libxext' 'libxft'
   'libxrender' 'libxt' 'libxtst')
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
   'lib32-ncurses5-compat-libs' 'lib32-zlib' 'lib32-libx11' 
   'lib32-libxau' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxft'
   'lib32-libxrender' 'lib32-libxt' 'lib32-libxtst')
fi

makedepends=('bash')

# A more permanent source for lib32-freetype2-2.5.0.1-1-x86-64 should be found
source=("https://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}/${_build_nr}/ib_tar/Quartus-lite-${pkgver}-linux.tar"
        "https://gaming.jhu.edu/mirror/archlinux/multilib/os/x86_64/lib32-freetype2-2.5.0.1-1-x86_64.pkg.tar.xz"   # Used for a freetype bugfix HACK
	"quartus.sh" "quartus.desktop" "51-usbblaster.rules" "quartus.install" "modelsim-ase.desktop" "modelsim-ae.desktop")
md5sums=('A3AD9370D0773F4E6AC41D1EAC4C85EE'
         'd3b3b7cdf874b6dd0b60c40d84dd9128'
         '067c444cae7fe31d3608245712b43ce8'
         '32b17cb8b992fc2dccd33d87f0dcd8ce'
         'f5744dc4820725b93917e3a24df13da9'
         'a331a81c44aed062a7af6d28542c3d82'
         'bb11a542139ea8ded899ea42588ec0f7'
         'eb4fbf2b7b3a2ffa59ccac57fff968e5')

options=('!strip' '!upx') # Stripping and UPX will takes ages, I'd avoid it.
install='quartus.install'
PKGEXT=".pkg.tar"

# Need to patch some Quartus/ModelSim files 
prepare() {
    cd "${srcdir}"
    
    echo "Notice: May require up to 54GB of free space during package building!"
    echo "Extracting install binaries and scripts from downloaded tar..."
    # Run setup.sh to extract Quartus, ModelSim, and device/help files
    DISPLAY="" bash ./setup.sh --mode unattended --unattendedmodeui none --installdir "${srcdir}${_alteradir}"
    echo "Finished extracting binaries and scripts."

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${srcdir}${_alteradir}/uninstall"
    rm -r "${srcdir}${_alteradir}/logs"
    
    # Replace altera directory in integration files
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop
    sed -i.bak "s,_alteradir,$_alteradir,g" "modelsim-${_modelsimver}.desktop"
    
    # Fix modelsim startup code for Linux Kernel >=4.0
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software
    sed -i.bak "s,linux_rh60,linux,g" "${srcdir}${_alteradir}/modelsim_${_modelsimver}/vco"  

    # Tell ModelSim where to find the specific lib32-freetype2 libraries it requires
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software#With_freetype2_2.5.0.1-1
    sed -i.bak2 "10s,^,export LD_LIBRARY_PATH=${_alteradir}/modelsim_${_modelsimver}/lib \n,g" "${srcdir}${_alteradir}/modelsim_${_modelsimver}/vco"
}

package() {
    # Copy Quartus over to pkgdir for installation
    mkdir -p "${pkgdir}${_alteradir}"
    cp -r "${srcdir}${_alteradir}"/* "${pkgdir}${_alteradir}"

    # Place the lib32-freetype2 libraries where ModelSim is now expecting them to be
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software#With_freetype2_2.5.0.1-1
    install -D -m755 usr/lib32/libfreetype.so* "${pkgdir}${_alteradir}/modelsim_${_modelsimver}/lib"
    
    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
    install -D -m644 modelsim-${_modelsimver}.desktop "${pkgdir}/usr/share/applications/modelsim-${_modelsimver}.desktop"
}

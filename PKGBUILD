# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Simon Hollingshead <me at [firstnamelastname] dot com>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# NOTE: Altera has dramatically changed their packing in regards to version 12. This
#       PKGBUILD will install the full Altera suite now. Be aware that the space requirement
#       is around 15GB now.
#
_basename=quartus-free
pkgname="${_basename}-130"
pkgver=13.0.1.232
pkgrel=3
pkgdesc="Quartus II 13.0 Web Edition, the last version to support Cyclone II and earlier FPGAs."
arch=('x86_64')
url="http://www.altera.com/products/software/quartus-ii/web-edition"
license=('custom')
provides=("${_basename}=${pkgver}")

_alteradir="/opt/altera/13.0sp1"

# According to the installer script, these dependencies are needed for the installer
depends=('lib32-glibc' 'lib32-libxext' 'lib32-libx11'
         'lib32-libxau' 'lib32-libxdmcp' 'lib32-freetype2'
         'lib32-fontconfig' 'lib32-expat' 'lib32-libpng12'
         'lib32-ncurses5-compat-libs' 'lib32-tkimg')

optdepends=('lib32-gtk: For eclipse-nios2 support'
            'lib32-libxtst: For eclipse-nios2 support')

makedepends=('lib32-fakeroot')

source=('http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_tar/Quartus-web-13.0.1.232-linux.tar'
        'quartus.sh' 'quartus.desktop' 'modelsim-ase.desktop' '51-usbblaster.rules')

sha256sums=('dac4d03ffb69c4657962343fdeaf5c20ca715ecbf06ee1bc7e00fe30fcbceb4c'
            '2a3d61e6f01aa16c9d3ddd40e9741b9fd080496db5437530b4e38faf6771c1ed'
            'd55d0df6fa87cab543979f2066ffe55d35167655cc134e07194f9694dbf738d7'
            '6ec0dcc53946590a3f9e12c239d968c3ae65fea5771a776a969c755d4880cdca'
            'dd9d33fa2698a0ec11ae86f4508f77e2e12bf4a21224f5b16640bc41d6c0999b')

options=('!strip' '!upx') # Stripping and UPX will takes ages, I'd avoid it.
PKGEXT=".pkg.tar" # Same as above, compressing takes too long.

package() {
    # Install version 13.0.1.232
    DISPLAY="" bash ./setup.sh --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}"
    
    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"
    
    # Replace altera directory in integration files
    sed -i "s,_alteradir,$_alteradir,g" quartus.sh
    sed -i "s,_alteradir,$_alteradir,g" quartus.desktop
    sed -i "s,_alteradir,$_alteradir,g" modelsim-ase.desktop

    # Fix modelsim startup code for Linux Kernel 4.0
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software
    sed -i 's,linux_rh60,linux,g' "${pkgdir}${_alteradir}"/modelsim_a{s,}e/vco

    # Modelsim bundles a copy of tkImg linked to an old version of libpng
    # Replace by system version
    for d in "${pkgdir}${_alteradir}/"modelsim_a{,s}e/linux{,aloem}; do
        rm -rf "$d"/Img1.3
        ln -s /usr/lib32/Img[0-9]* "$d"/Img
    done

    # Fix modelsim path in VWF viewer
    sed -i '108,+2{s,win32aloem,linuxaloem,;s,\\\\,/,g}' "${pkgdir}${_alteradir}"/quartus/common/tcl/apps/qsim/qsim_script_modified.tcl

    # Fix VWF always running modelsim_ae
    sed -i '107s,\[.*\],\[info exists ::env\(LM_LICENSE_FILE\)\],' "${pkgdir}${_alteradir}"/quartus/common/tcl/apps/qsim/qsim_script_modified.tcl

    # Fix VWF setting windows perms to files
    sed -i '1055,+2s,-readonly 0,-permissions ug+w,' "${pkgdir}${_alteradir}"/quartus/common/tcl/apps/qsim/qsim_script_modified.tcl

    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/quartus/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.zz-13.0.sh" # Hack to sort after quartus.sh
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster-13.0.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus-13.0.desktop"
    install -D -m644 modelsim-ase.desktop "${pkgdir}/usr/share/applications/modelsim-ase-13.0.desktop"
}

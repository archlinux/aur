# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
#
pkgname=quartus-free
_mainver=18.1
# Keep dot in _patchver
_patchver=.0
_buildver=625
_basever=.0.614
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="Quartus Prime Lite Edition design software for Altera FPGA's"
arch=('x86_64')
url="https://dl.altera.com/?edition=lite"
license=('custom')

_alteradir="/opt/altera/${_mainver}"

# According to the installer script, these dependencies are needed for the installer
depends=('lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-glibc'
         'lib32-gtk2' 'lib32-libcanberra' 'lib32-libpng' 'lib32-libice' 'lib32-libsm'
         'lib32-util-linux' 'lib32-ncurses' 'lib32-ncurses5-compat-libs' 'lib32-zlib'
         'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxft'
         'lib32-libxrender' 'lib32-libxt' 'lib32-libxtst' 'lib32-tkimg' 'libpng12')

makedepends=('patchelf')

source=("http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_tar/Quartus-lite-${pkgver}-linux.tar"
        'quartus.sh' 'quartus.desktop' 'modelsim-ase.desktop' '51-usbblaster.rules')
sha256sums=('abf4018d972c9de3b53117cbfce84f6fc7888f45db169978f993f0c1684ad3fd'
            '2a3d61e6f01aa16c9d3ddd40e9741b9fd080496db5437530b4e38faf6771c1ed'
            'f8ba2a84c6f7551bb4ab62d17f77e2814c70871ddb15f0276f1bf89cc6c674b8'
            '1092f7fe1e6471f2f6fe12177ecb8781c26ec1fededd10f9e65de921debb8696'
            'dd9d33fa2698a0ec11ae86f4508f77e2e12bf4a21224f5b16640bc41d6c0999b')

options=(!strip !debug) # Stripping will takes ages, I'd avoid it
PKGEXT=".pkg.tar" # Same for compression

package() {
    echo "Notice: Requires around 34GB of free space during package building!"
    echo "Extracting install binaries and scripts from downloaded tar..."

    DISPLAY="" bash ./setup.sh --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${pkgdir}${_alteradir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    # Remove useless unzip binaries
    find "${pkgdir}${_alteradir}" \( -name "unzip" -or -name "unzip32" \) -delete

    # Fix interpreter for the license manager
    for prog in quartus/linux64/{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${pkgdir}${_alteradir}/${prog}"
    done
    for prog in ip/altera/mentor_vip_ae/common/linux{,_x86_64}/mgls/bin/lmgrd modelsim_ase/linuxaloem/{mgls/bin/,}{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib/ld-linux.so.2 "${pkgdir}${_alteradir}/${prog}"
    done

    # Fix world writable permissions
    find "${pkgdir}${_alteradir}/nios2eds/documents" -perm -o+w -exec chmod go-w {} \+

    # Replace altera directory in integration files
    sed -i "s,_alteradir,${_alteradir},g" quartus.sh
    sed -i "s,_alteradir,${_alteradir},g" quartus.desktop
    sed -i "s,_alteradir,${_alteradir},g" modelsim-ase.desktop
    
    # Fix modelsim startup code for Linux Kernel >=4.0
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software
    sed -i 's,linux_rh60,linux,g' "${pkgdir}${_alteradir}/modelsim_ase/vco"

    # Modelsim bundles a copy of tkImg linked to old versions of libs
    # Replace by system version
    rm -rf "${pkgdir}${_alteradir}/modelsim_ase/linuxaloem/Img1.3"
    ln -s /usr/lib32/Img[0-9]* "${pkgdir}${_alteradir}/modelsim_ase/linuxaloem/Img"

    # Remove pkgdir reference in sopc_builder
    sed -i "s,${pkgdir},,g" "${pkgdir}${_alteradir}/quartus/sopc_builder/.sopc_builder"

    # Suppress spurious warning about linux-gate.so.1
    sed -i '/msg_system/a suppress = 3116' "${pkgdir}${_alteradir}/modelsim_ase/modelsim.ini"

    # Copy license file
    install -D -m644 "${pkgdir}${_alteradir}/licenses/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
    install -D -m644 modelsim-ase.desktop "${pkgdir}/usr/share/applications/modelsim-ase.desktop"
}

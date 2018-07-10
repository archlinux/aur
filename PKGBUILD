# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
#
pkgname=quartus-free
_mainver=18.0
# Keep dot in _patchver
_patchver=.0
_buildver=614
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
         'lib32-libxrender' 'lib32-libxt' 'lib32-libxtst' 'libpng12')

makedepends=('unzip' 'metakit' 'tcl-cookfs' 'tdom' 'patchelf')

source=("http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_tar/Quartus-lite-${pkgver}-linux.tar"
        'quartus.sh' 'quartus.desktop' 'modelsim-ase.desktop' '51-usbblaster.rules' 'installFiles.tcl')
sha256sums=('25d40a57c1c2e66a36f18fd7545b5ba39e75e7db6201bb0c86da8e909d5a8915'
            '2a3d61e6f01aa16c9d3ddd40e9741b9fd080496db5437530b4e38faf6771c1ed'
            'f8ba2a84c6f7551bb4ab62d17f77e2814c70871ddb15f0276f1bf89cc6c674b8'
            '1092f7fe1e6471f2f6fe12177ecb8781c26ec1fededd10f9e65de921debb8696'
            'dd9d33fa2698a0ec11ae86f4508f77e2e12bf4a21224f5b16640bc41d6c0999b'
            'e91f5fceffe9220f15edd6fc403c578ad260ba81debf27a4978d0c07fcd8649e')

options=(!strip !debug) # Stripping will takes ages, I'd avoid it
PKGEXT=".pkg.tar" # Same for compression

package() {
    echo "Notice: Requires around 34GB of free space during package building!"
    echo "Extracting install binaries and scripts from downloaded tar..."

    # Quartus installer deadlocks when using recent glibc
    # Work around it by doing the install ourselves

    echo "==> Installing QuartusLiteSetup"
    ./installFiles.tcl components/QuartusLiteSetup-${_mainver}${_basever}-linux.run "${pkgdir}${_alteradir}"

    echo "==> Installing QuartusHelpSetup"
    ./installFiles.tcl components/QuartusHelpSetup-${_mainver}${_basever}-linux.run "${pkgdir}${_alteradir}"
    unzip -qq -o "${pkgdir}${_alteradir}/quartus/common/help/webhelp.zip" -d "${pkgdir}${_alteradir}/quartus/common/help/"
    rm -f "${pkgdir}${_alteradir}/quartus/common/help/webhelp.zip"

    echo "==> Installing ModelSimSetup"
    ./installFiles.tcl components/ModelSimSetup-${_mainver}${_basever}-linux.run "${pkgdir}${_alteradir}" "product_key modelsim_ase"
    unzip -qq -o "${pkgdir}${_alteradir}/modelsim_ase/altera/modelsim_altera_verilog.zip" -d "${pkgdir}${_alteradir}/modelsim_ase/altera"
    rm -f "${pkgdir}${_alteradir}/modelsim_ase/altera/modelsim_altera_verilog.zip"
    unzip -qq -o "${pkgdir}${_alteradir}/modelsim_ase/altera/modelsim_altera_vhdl.zip" -d "${pkgdir}${_alteradir}/modelsim_ase/altera"
    rm -f "${pkgdir}${_alteradir}/modelsim_ase/altera/modelsim_altera_vhdl.zip"

    for dev in arria_lite cyclone10lp cyclone cyclonev max10 max; do
        echo "=> Installing component files for ${dev} devices"
        unzip -qq -o components/${dev}-${_mainver}${_basever}.qdz -d "${pkgdir}${_alteradir}"
    done

    #echo "=> Installing update file QuartusSetup-${pkgver}"
    #./installFiles.tcl components/QuartusSetup-${pkgver}-linux.run "${pkgdir}${_alteradir}"
    echo "Finished extracting binaries and scripts."

    # Remove useless unzip binaries
    find "${pkgdir}${_alteradir}" \( -name "unzip" -or -name "unzip32" \) -delete
    # Remove not installed folder
    rmdir "${pkgdir}${_alteradir}/modelsim_ae"

    # vlib needs this folder for some reason
    ln -s ${_alteradir}/modelsim_ase/linuxaloem "${pkgdir}${_alteradir}/modelsim_ase/linuxpe"

    # Fix interpreter for the license manager
    for prog in quartus/linux64/{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${pkgdir}${_alteradir}/${prog}"
    done
    for prog in ip/altera/mentor_vip_ae/common/linux{,_x86_64}/mgls/bin/lmgrd modelsim_ase/linuxaloem/{mgls/bin/,}{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib/ld-linux.so.2 "${pkgdir}${_alteradir}/${prog}"
    done

    # Fix world writable permissions
    find "${pkgdir}${_alteradir}/nios2eds/documents" -perm -o+w -exec chmod go-w {} \+

    # Create Lite "license" files
    touch "${pkgdir}${_alteradir}/quartus/linux64/qvweid.fil"
    touch "${pkgdir}${_alteradir}/modelsim_ase/lib/.awe"

    # This file is removed for some reason
    rm -f "${pkgdir}${_alteradir}/quartus/linux64/libsys_tb2_base.so"

    # The installer creates this file
    mkdir -p "${pkgdir}${_alteradir}/quartus/sopc_builder"
    cat > "${pkgdir}${_alteradir}/quartus/sopc_builder/.sopc_builder" <<EOF
# .sopc_builder configuration file:
sopc_builder = "${_alteradir}/quartus/sopc_builder";
sopc_legacy_dir = "";
sopc_quartus_dir = "${_alteradir}/quartus/";
sopc_modelsim_dir = "";
sopc_ui_debug = "0";
EOF

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

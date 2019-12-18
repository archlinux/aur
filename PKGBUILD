# Maintainer: Nico Rumpeltin <$forename at $surname dot de>
# Contributor: Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
#
pkgbase=intel_fpga_lite
pkgname=(${pkgbase}-{base,ip,modelsim_ase,nios2eds,quartus,quartus-help,quartus-arria_lite,quartus-cyclone,quartus-cyclone10lp,quartus-cyclonev,quartus-max,quartus-max10} ${pkgbase})
_mainver=19.1
# Keep dot in _patchver
_patchver=.0
_buildver=670
_basever=.0.670
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=2
pkgdesc="Quartus Prime Lite Edition design software for Intel FPGA's. Split packages"
arch=('x86_64')
url="http://fpgasoftware.intel.com/?edition=lite"
license=('custom')

_inteldir="/opt/intel_fpga_lite/${_mainver}"

# According to the installer script, these dependencies are needed for the installer
depends=('lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-glibc'
         'lib32-gtk2' 'lib32-libcanberra' 'lib32-libpng' 'lib32-libice' 'lib32-libsm'
         'lib32-util-linux' 'lib32-ncurses' 'lib32-ncurses5-compat-libs' 'lib32-zlib'
         'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxft'
         'lib32-libxrender' 'lib32-libxt' 'lib32-libxtst' 'lib32-tkimg' 'libpng12')

makedepends=('patchelf')

source=("http://download.altera.com/akdlm/software/acdsinst/${_mainver}std${_patchver/.0/}/${_buildver}/ib_tar/Quartus-lite-${pkgver}-linux.tar"
        'quartus.sh' 'quartus.desktop' 'modelsim-ase.sh' 'modelsim-ase.desktop' '51-usbblaster.rules')
sha256sums=('3546e90f6496b17c3c3e3e8582a3991940ad73ed112740428864460cfab6e40a'
            '16206c08cd04fb02318a20e053346c68e77275b324ca24cfb3da64b03420ab3c'
            'f263e0c2d469564b51c131cc450e8ee6cd0a2f059153e01ac7e498e2f9d6a9c9'
            '363be8b0656b56f92c34ac0581a8a0f3bb1edaa9da361f50d1e60ec3334c13a7'
            'a37738de447c50ca7bfe856466bd9567850ccf45ac6c3f0a6e63ef5bb863645f'
            'dd9d33fa2698a0ec11ae86f4508f77e2e12bf4a21224f5b16640bc41d6c0999b')

options=(!strip !debug) # Stripping will takes ages, I'd avoid it

build() {
    rm -rf "${srcdir}/install"
    
    echo "Notice: Requires around 24GB of free space during package building!"
    echo "Notice: The package file also requires around 16GB of free space"
    echo "Extracting install binaries and scripts from downloaded tar..."

    DISPLAY="" bash ./setup.sh --mode unattended --unattendedmodeui none --accept_eula 1 --installdir "${srcdir}/install"
    
    # Remove useless unzip binaries
    find "${srcdir}/install" \( -name "unzip" -or -name "unzip32" \) -delete

    # Fix interpreter for the license manager
    for prog in quartus/linux64/{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${srcdir}/install/${prog}"
    done
    for prog in modelsim_ase/linuxaloem/{mgls/bin/,}{lmutil,lmgrd}; do
        patchelf --set-interpreter /lib/ld-linux.so.2 "${srcdir}/install/${prog}"
    done

    # Fix world writable permissions
    find "${srcdir}/install/nios2eds/documents" -perm -o+w -exec chmod go-w {} \+

    # Replace altera directory in integration files
    sed -i "s,_inteldir,${_inteldir},g" quartus.sh
    sed -i "s,_inteldir,${_inteldir},g" quartus.desktop
    sed -i "s,_inteldir,${_inteldir},g" modelsim-ase.sh
    sed -i "s,_inteldir,${_inteldir},g" modelsim-ase.desktop
    
    # Fix modelsim startup code for Linux Kernel >=4.0
    # see https://wiki.archlinux.org/index.php/Altera_Design_Software
    sed -i 's,linux_rh60,linux,g' "${srcdir}/install/modelsim_ase/vco"

    # Modelsim bundles a copy of tkImg linked to old versions of libs
    # Replace by system version
    rm -rf "${srcdir}/install/modelsim_ase/linuxaloem/Img1.3"
    ln -s /usr/lib32/Img[0-9]* "${srcdir}/install/modelsim_ase/linuxaloem/Img"

    # Remove pkgdir reference in sopc_builder
    sed -i "s,${pkgdir},,g" "${srcdir}/install/quartus/sopc_builder/.sopc_builder"

    # Suppress spurious warning about linux-gate.so.1
    sed -i '/msg_system/a suppress = 3116' "${srcdir}/install/modelsim_ase/modelsim.ini"

    # mv help
    mkdir -p "${srcdir}/install/help/"
    mv "${srcdir}/install/quartus/common/help/tutorial" "${srcdir}/install/help/"
    mv "${srcdir}/install/quartus/common/help/webhelp" "${srcdir}/install/help/"

    # mv devices
    mkdir -p "${srcdir}/install/devinfo"
    mv "${srcdir}/install/quartus/common/devinfo/arriaii" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/cycloneive" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/cycloneivgx" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/cyclone10lp" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/cyclonev" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/maxii" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/maxv" "${srcdir}/install/devinfo/"
    mv "${srcdir}/install/quartus/common/devinfo/55nm" "${srcdir}/install/devinfo/"
}

package_intel_fpga_lite-base() {
    # Copy license file
    install -D -m644 "${srcdir}/install/licenses/license.txt" "${pkgdir}/usr/share/licenses/intel_fpga_lite/LICENSE"
    mkdir -p "${pkgdir}${_inteldir}"
    mv "${srcdir}/install/licenses" "${pkgdir}${_inteldir}"
}

package_intel_fpga_lite-ip() {
    depends=("intel_fpga_lite-base=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}"
    mv "${srcdir}/install/ip" "${pkgdir}${_inteldir}"
}

package_intel_fpga_lite-modelsim_ase(){
    depends=("intel_fpga_lite-base=$pkgver-$pkgrel")
    install -D -m755 modelsim-ase.sh "${pkgdir}/etc/profile.d/modelsim-ase.sh"
    install -D -m644 modelsim-ase.desktop "${pkgdir}/usr/share/applications/modelsim-ase.desktop"
    mkdir -p "${pkgdir}${_inteldir}"
    mv "${srcdir}/install/modelsim_ase" "${pkgdir}${_inteldir}"
}

package_intel_fpga_lite-nios2eds(){
    depends=("intel_fpga_lite-base=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}"
    mv "${srcdir}/install/nios2eds" "${pkgdir}${_inteldir}"
}

package_intel_fpga_lite-quartus(){
    depends=("intel_fpga_lite-base=$pkgver-$pkgrel" "intel_fpga_lite-ip=$pkgver-$pkgrel")

    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
    # Install usb blaster udev rule
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"

    mkdir -p "${pkgdir}${_inteldir}"
    mv "${srcdir}/install/quartus" "${pkgdir}${_inteldir}"
}

package_intel_fpga_lite-quartus-help(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/help/"
    mv "${srcdir}/install/help/tutorial" "${pkgdir}${_inteldir}/quartus/common/help/"
    mv "${srcdir}/install/help/webhelp" "${pkgdir}${_inteldir}/quartus/common/help/"
}

package_intel_fpga_lite-quartus-arria_lite(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/arriaii" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
}

package_intel_fpga_lite-quartus-cyclone(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/cycloneive" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/cycloneivgx" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
}

package_intel_fpga_lite-quartus-cyclone10lp(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/cyclone10lp" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
}

package_intel_fpga_lite-quartus-cyclonev(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/cyclonev" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
}

package_intel_fpga_lite-quartus-max(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/maxii" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/maxv" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
}

package_intel_fpga_lite-quartus-max10(){
    depends=("intel_fpga_lite-quartus=$pkgver-$pkgrel")
    mkdir -p "${pkgdir}${_inteldir}/quartus/common/devinfo/"
    mv "${srcdir}/install/devinfo/55nm" "${pkgdir}${_inteldir}/quartus/common/devinfo/"
}

package_intel_fpga_lite() {
    depends=(${pkgbase}-{base,ip,modelsim_ase,nios2eds,quartus,quartus-help,quartus-arria_lite,quartus-cyclone,quartus-cyclone10lp,quartus-cyclonev,quartus-max,quartus-max10})
}

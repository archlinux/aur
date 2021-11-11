# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
#
pkgname=modelsim-intel-starter
# Keep dot in _patchver
_mainver=20.1; _patchver=.1; _buildver=720
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="ModelSim-Intel FPGA Starter Edition - last version"
arch=('x86_64')
url="http://fpgasoftware.intel.com"
license=('custom')

_inteldir="/opt/intelFPGA/${_mainver}"

# According to the installer script, these dependencies are needed for the installer
depends=('ld-lsb' 'lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-glibc' 'lib32-gtk2'
         'lib32-libcanberra' 'lib32-libpng' 'lib32-libice' 'lib32-libsm' 'lib32-util-linux'
         'lib32-ncurses' 'lib32-ncurses5-compat-libs' 'lib32-zlib' 'lib32-libx11' 'lib32-libxau'
         'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxft' 'lib32-libxrender' 'lib32-libxt'
         'lib32-libxtst' 'lib32-alsa-lib' 'lib32-libxi' 'lib32-libxml2')

provides=("quartus-free-modelsim=$pkgver")

_base_url="https://download.altera.com/akdlm/software/acdsinst"
source=("${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/ModelSimSetup-${pkgver}-linux.run"
        'modelsim-ase.sh' 'modelsim-ase.desktop' 'modelsim.gif')
md5sums=('adfdde0d455dadedd2cc094cbf771352'
         'e91f504f7f69c76c2424a3e221a97be6'
         '3020e5a5c8ae3e4b6da536a363982e38'
         '9d160ea4bbf6b889684a7e925b7d1b54')

options=('!strip' '!debug') # Stripping will takes ages, I'd avoid it
PKGEXT=".pkg.tar.zst" # ZSTD is fast enough for compression

prepare() {
    chmod +x ModelSimSetup-${pkgver}-linux.run
}

package() {
    DISPLAY="" ./ModelSimSetup-${pkgver}-linux.run \
        --modelsim_edition modelsim_ase \
        --mode unattended \
        --unattendedmodeui none \
        --accept_eula 1 \
        --installdir "${pkgdir}${_inteldir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/uninstall"
    rm -r "${pkgdir}${_inteldir}/logs"

    # Fix missing permissions
    find "${pkgdir}${_inteldir}" \! -perm /o+rwx -exec chmod o=g {} \;

    # Replace altera directory in integration files
    sed -i "s,@_inteldir@,${_inteldir},g" modelsim-ase.sh
    sed -i "s,@_inteldir@,${_inteldir},g" modelsim-ase.desktop

    # Suppress spurious warning about linux-gate.so.1
    sed -i '/msg_system/a suppress = 3116' "${pkgdir}${_inteldir}/modelsim_ase/modelsim.ini"

    # Install integration files
    install -D -m755 modelsim-ase.sh "${pkgdir}/etc/profile.d/modelsim-ase.sh"
    install -D -m644 modelsim-ase.desktop "${pkgdir}/usr/share/applications/modelsim-ase.desktop"
    install -D -m644 modelsim.gif "${pkgdir}${_inteldir}/modelsim_ase/modelsim.gif"
}

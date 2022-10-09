# Submitter: Sebastian Weiss <dl3yc at darc dot de>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
pkgname=quartus-standard-programmer
_mainver=19.1; _patchver=.0; _buildver=670
pkgver=${_mainver}${_patchver}.${_buildver}
pkgrel=1
pkgdesc="Quartus Prime Programmer and Tools"
arch=('x86_64')
url="http://fpgasoftware.intel.com/?edition=standard"
license=('custom')

_inteldir="/opt/intelFPGA/${_mainver}"

depends=('expat' 'fontconfig' 'freetype2' 'glibc' 'libice' 'libsm'
         'util-linux' 'ncurses' 'tcl' 'zlib' 'libx11' 'libxau'
         'libxdmcp' 'libxext' 'libxft' 'libxrender' 'libxt' 'libxtst')

_base_url="https://download.altera.com/akdlm/software/acdsinst"
source=("${_base_url}/${_mainver}std${_patchver/.0/}/${_buildver}/ib_installers/QuartusProgrammerSetup-${pkgver}-linux.run"
        "51-usbblaster.rules"
        "quartus.sh")
sha256sums=('3c829397efcf9307a0bb044b3da3bd4a8a6b7a2cb5bcb56c4432d364ad9bd416'
            '02341b69e0d56dacb86df911092ac249df3c9a301a3169b20204859eef2d854b'
            '7b4bfe06f7e11c82117d16811a83626adf38a2000ce5be1cbdf1d1f1da74211a')

options=(!strip)
PKGEXT=".pkg.tar" # Do not compress
prepare() {
    cd "${srcdir}"
    chmod a+x "QuartusProgrammerSetup-${pkgver}-linux.run"
}

package() {
    DISPLAY="" ./QuartusProgrammerSetup-${pkgver}-linux.run --accept_eula 1 --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_inteldir}"

    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_inteldir}/"{uninstall,logs}

    # Replace altera directory in integration files
    sed -i "s,@_inteldir@,${_inteldir},g" quartus.sh

    # Install integration files
    install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
}

post_install() {
	update-desktop-database -q
}

post_upgrade() {
	update-desktop-database -q
}


post_remove() {
	update-desktop-database -q
}

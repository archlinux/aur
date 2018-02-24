# Submitter: Sequencer <liujiuyang1994 at gmail dot com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the plugdev group.
# http://download.altera.com/akdlm/software/acdsinst/17.1std.1/593/ib_installers/QuartusProgrammerSetup-17.1.1.593-linux.run
# http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_installers/QuartusProgrammerSetup-17.1.0.590-linux.run
pkgname=quartus-standard-programmer
pkgver=17.1.1.593
_oldver=17.1.0.590
pkgrel=1
pkgdesc="Quartus Prime Programmer and Tools "
arch=('x86_64')
url="http://dl.altera.com/?edition=standard"
license=('custom')

_alteradir="/opt/altera"

#depends=('desktop-file-utils' 'expat' 'fontconfig' 'freetype2'
#'glibc' 'gtk2' 'libcanberra' 'libpng' 'libpng12' 'libice' 'libsm'
#'util-linux' 'ncurses' 'tcl' 'tcllib' 'zlib' 'libx11' 'libxau'
#'libxdmcp' 'libxext' 'libxft' 'libxrender' 'libxt' 'libxtst')

source=("http://download.altera.com/akdlm/software/acdsinst/17.1std.1/593/ib_installers/QuartusProgrammerSetup-${pkgver}-linux.run"
        "http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_installers/QuartusProgrammerSetup-${_oldver}-linux.run"
        "51-usbblaster.rules"
        "quartus.install")
sha256sums=('c816847e72753c8fd625361d26ba269f88ad6f5ed4a613d43e9871373faf05a6'
            '69975a8f1530378b45de871f0677818d35f61237c936753cb660a939bc70a12c'
            'dd9d33fa2698a0ec11ae86f4508f77e2e12bf4a21224f5b16640bc41d6c0999b'
            '0e815b138bcec2d1f9c6aa498d2f56cc131417119af19016a2019173da526d9b')

options=(!strip !upx) # Stripping and UPX will takes ages, I'd avoid it.
install='quartus.install'
PKGEXT=".pkg.tar" # Do not compress
prepare() {
    cd "${srcdir}"
    chmod a+x "QuartusProgrammerSetup-${pkgver}-linux.run"
    chmod a+x "QuartusProgrammerSetup-${_oldver}-linux.run"
}

package() {
    cd "${srcdir}"
    echo "Packaging base"
    DISPLAY="" ./"QuartusProgrammerSetup-${_oldver}-linux.run" --accept_eula 1 --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}" &>/dev/null & 
    while [ ! -f "${pkgdir}${_alteradir}/logs/qprogrammer-${_oldver}-linux-install.log" ]; do
        echo "waiting for QuartusProgrammerSetup-${_oldver}"
        sync
        sleep 10
    done
    killall -9 "QuartusProgrammerSetup-${_oldver}-linux.run"
    echo "Packaging upgrade"
    DISPLAY="" ./"QuartusProgrammerSetup-${pkgver}-linux.run" --accept_eula 1 --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}" &>/dev/null & 
    while [ ! -f "${pkgdir}${_alteradir}/logs/qprogrammer-${pkgver}-linux-install.log" ]; do
        echo "waiting for QuartusProgrammerSetup-${pkgver}"
        sync
        sleep 10
    done
    killall -9 "QuartusProgrammerSetup-${pkgver}-linux.run"

    
    # Remove uninstaller and install logs since we have a working package management
    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    # Install integration files
    install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
}

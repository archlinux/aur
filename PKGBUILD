# Maintainer: Jake Sprouse <jake at jakesprouse dot net>
# Maintainer: Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-msp430ware
pkgver=3.80.14.01
pkgrel=2
pkgdesc="Texas Instruments MSP430Ware library for MSP430 microcontrollers"
arch=('x86_64')
url="https://www.ti.com/tool/MSPWARE"
license=('custom')

# lib32-glibc needed for the installer
makedepends=('lib32-glibc' 'lib32-fakeroot')

_name=MSP430Ware_${pkgver//./_}
_installer=${_name}_setup.run

# To download the file, you need to manually navigate to the website, create an
# account, and accept the license for this software. Otherwise, this pkgbuild
# would download an HTML page that will fail the checksum check. Once you accepted
# the license, then you can either download the file manually and place it in
# the folder with this PKGBUILD, or you could paste the identifier that appears
# in the final download URL from TI website into this variable:
_gda=

source=("local://${_installer}"
        #https://dr-download.ti.com/secure/software-development/software-development-kit-sdk/MD-L2UkJRAuzb/${pkgver}/${_installer}?__gda__=${_gda}"
)

md5sums=("8b2030e98e62e1cf37871015cbc68617") # TI website lists the MD5 sum specifically

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_installdir=opt/ti

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    echo ">>> Running installer..."
    ./${_installer} --mode unattended --prefix $pkgdir/${_installdir}

    mv $pkgdir/${_installdir}/{install_logs,${_name}}/${_name}_install.log
    rmdir $pkgdir/${_installdir}/install_logs

    install -D -m0644 $pkgdir/${_installdir}/${_name}/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

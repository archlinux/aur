# Maintainer: Jake Sprouse <jake at jakesprouse dot net>
# Maintainer: Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-msp430ware
pkgver=3.80.09.03
_upver=3_80_09_03
pkgrel=1
pkgdesc="Texas Instruments MSP430Ware library for MSP430 microcontrollers"
arch=('x86_64')
url="https://www.ti.com/tool/MSPWARE"
license=('custom')

# lib32-glibc needed for the installer
makedepends=('lib32-glibc' 'lib32-fakeroot')

_name=MSP430Ware_${_upver}
_installer=${_name}_setup.run
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Ware/latest/exports/${_installer}")

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_installdir=opt/ti

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    echo ">>> To save time, you can build uncompressed package:"
    echo ">>>   PKGEXT=.pkg.tar makepkg"

    echo ">>> Running installer..."
    echo ">>> Errors about acl like below are harmless (please ignore):"
    echo ">>>   dlsym(acl_get_fd): /usr/lib32/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd"
    ./${_installer} --mode unattended --prefix $pkgdir/${_installdir}

    mv $pkgdir/${_installdir}/{install_logs,${_name}}/${_name}_install.log
    rmdir $pkgdir/${_installdir}/install_logs

    install -D -m0644 $pkgdir/${_installdir}/${_name}/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('b3adefb73822bea298159f77a172519e8fad95e0c89e703b7d52c537da9776d9')

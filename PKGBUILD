# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-msp430
pkgver=19.6.0.STS
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for MSP430"
arch=('x86_64')
url="https://www.ti.com/tool/MSP-CGT"
license=('custom')

# lib32-glibc needed for the installer
makedepends=('lib32-glibc')

optdepends=('ccstudio')

_installer=ti_cgt_msp430_${pkgver}_linux_installer_x86.bin
source=("http://software-dl.ti.com/codegen/esd/cgt_public_sw/MSP430/${pkgver}/${_installer}")


options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installloc=$_ccsdir/ccs/tools/compiler
_installpath=$_installdir/$_destdir/$_installloc
_tooldir=${pkgname}_${pkgver}

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

build() {
    cd $srcdir

    # Calling from build to avoid fakeroot, assuming the same problem exists as
    # for ccstudio installer (see ccstudio/PKGBUILD for details)
    ./${_installer} --mode unattended --prefix $srcdir/$_installpath
}

package() {

    # Hardlink to avoid time and space overhead
    cp -ral $srcdir/$_installdir/$_destdir $pkgdir/

    # Match permissions to ccstudio package (see notes in ccstudio.install)
    find $pkgdir/$_destdir/$_ccsdir -type d -exec chmod 0775 {} \;

    install -D -m0644 $srcdir/${_installpath}/${pkgname}_${pkgver}/MSP430_RTS_${pkgver}_manifest.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

sha256sums=('842eb32a5104b9b1bc91e00d3a3d92d25829a7998ea83db4a1cdf8052685622c')

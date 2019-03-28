# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-msp430
pkgver=18.12.0.LTS
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for MSP430"
arch=('x86_64')
url="http://software-dl.ti.com/codegen/non-esd/downloads/index.htm#MSP430"
#url="http://www.ti.com/tools-software/compilers/download.html"
license=('custom')

optdepends=('ccstudio')

_installer=ti_cgt_msp430_${pkgver}_linux_installer_x86.bin
source=("http://downloads.ti.com/codegen/esd/cgt_public_sw/MSP430/${pkgver}/${_installer}")


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

    # Version in filename is out of date upstream
    # File is gone in this version. Oh well.
    #install -D -m0644 $srcdir/${_installpath}/${pkgname}_${pkgver}/MSP430_RTS_18.12.0.LTS.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

sha256sums=('cd77891ece4aaf7f07eb96549f4d18f184844aee845eeeb0a51ace4798d97f83')

# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-msp430
pkgver=18.1.1
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for MSP430"
arch=('x86_64')
url="http://software-dl.ti.com/codegen/non-esd/downloads/index.htm"
#url="http://www.ti.com/tools-software/compilers/download.html"
license=('custom')

optdepends=('ccstudio')

_fullver=${pkgver}.LTS
_installer=ti_cgt_msp430_${_fullver}_linux_installer_x86.bin
source=("${_installer}::http://software-dl.ti.com/codegen/esd/cgt_public_sw/MSP430/${_fullver}/${_installer}")

md5sums=('2de92040dda2d41bb394aa658c112027')

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installloc=$_ccsdir/ccsv7/tools/compiler
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
}

# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=18.1.1
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM"
arch=('x86_64')
url="http://www.ti.com/tool/download/ARM-CGT-17"
#url="http://www.ti.com/tools-software/compilers/download.html"
#url="http://software-dl.ti.com/codegen/non-esd/downloads/index.htm"
license=('custom')

optdepends=('ccstudio')

_fullver=${pkgver}.LTS
_installer="ti_cgt_tms470_${_fullver}_linux_installer_x86.bin"
source=("http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${_fullver}/${_installer}")

md5sums=('366b61dc339afdaa53285f3e92ff158d')

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installloc=$_ccsdir/ccsv7/tools/compiler
_installpath=$_installdir/$_destdir/$_installloc

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

    install -D -m0644 $srcdir/${_installpath}/${pkgname}_${_fullver}/ARM_RTS_18.1.0.LTS.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=18.1.3.LTS
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM"
arch=('x86_64')
url="http://www.ti.com/tool/download/ARM-CGT-17"
#url="http://www.ti.com/tools-software/compilers/download.html"
#url="http://software-dl.ti.com/codegen/non-esd/downloads/index.htm"
license=('custom')

optdepends=('ccstudio')

_installer="ti_cgt_tms470_${pkgver}_linux_installer_x86.bin"
source=("http://downloads.ti.com/codegen/esd/cgt_public_sw/TMS470/${pkgver}/${_installer}")

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsver=8
_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installloc=$_ccsdir/ccsv$_ccsver/tools/compiler
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

    # Version in filename is out of date upstream
    install -D -m0644 $srcdir/${_installpath}/${pkgname}_${pkgver}/ARM_RTS_18.1.0.LTS.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

sha256sums=('00bdab078d7f0c96b878578cbec3b7ab62260ddfca64bb09ebc75c1041aa8689')

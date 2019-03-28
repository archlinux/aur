# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=18.12.0.LTS
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

_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installloc=$_ccsdir/ccs/tools/compiler
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

    # License file gone in this version. Oh well.
    #install -D -m0644 $srcdir/${_installpath}/${pkgname}_${pkgver}/ARM_RTS_18.12.0_LTS.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

sha256sums=('ba389084b5594d1712147fa4f51ec305f75f446f5337e39ca972348aced8212b')

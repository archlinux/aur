# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-msp430
pkgver=17.9.0
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for MSP430"
arch=('x86_64')
url="http://software-dl.ti.com/codegen/non-esd/downloads/index.htm"
license=('custom')

# BitRock InstallBuilder installer breaks with glibc 2.25 (hangs on exit):
#   https://e2e.ti.com/support/development_tools/code_composer_studio/f/81/t/583306
#   https://e2e.ti.com/support/development_tools/code_composer_studio/f/81/t/594586
#
# To build in chroot with glibc 2.24 (2016/10/31), follow [[DeveloperWiki:Building in a Clean Chroot]]:
#   Create pacman.conf.20161031 with:
#    [core]
#    SigLevel = PackageRequired
#    Server=https://archive.archlinux.org/repos/2016/10/31/$repo/os/$arch
#    # same for [extra], [community], [multilib]
#
#   pacman -S devtools
#   mkdir ~/chroot
#   CHROOT=$HOME/chroot
#   mkarchroot -C pacman.conf.20161031 $CHROOT/root base-devel lib32-glibc lib32-gcc-libs
#   makechrootpkg -c -r $CHROOT
#
# deps: lib32* are needed because the installers is 32-bit
makedepends=('glibc<2.25' 'lib32-glibc<2.25' 'lib32-gcc-libs')
optdepends=('ccstudio')

_installer=ti_cgt_msp430_${pkgver}.STS_linux_installer_x86.bin
source=("${_installer}::http://software-dl.ti.com/codegen/esd/cgt_public_sw/MSP430/${pkgver}.STS/${_installer}")

md5sums=('f91748dd2e6546156b3ae96ebece364b')

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

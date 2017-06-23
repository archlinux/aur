# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=5.2.9
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM"
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

_key="1498567832_371f115bafa0544a3f0554f3ada95299"
_installer=ti_cgt_tms470_${pkgver}_linux_installer_x86.bin
source=("${_installer}::https://downloads.ti.com/downloads/codegen/esd/cgt_registered_sw/TMS470/5.2.9/${_installer}?__gda__=${_key}")

md5sums=('ca3b062fc108aa9ef89e6c2e12a0f051')

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_destdir=opt
_installdir=installdir
_installpath=$_installdir/$_destdir/ccstudio/ccsv7/tools/compiler

build() {
	cd $srcdir/${_archive}

    echo ">>> Executing installer. You can monitor progress with:"
    echo ">>>     tail -f ${srcdir}/${_installpath}/ccsv7/install_logs/*/ccs_setup_${pkgver}_install.log"

    # Assuming the same problem exists as for ccstudio installer (see ccstudio/PKGBUILD for details)
    ./${_installer} --mode unattended --prefix $srcdir/$_installpath
}

package() {
    # Hardlink to avoid time and space overhead
    cp -ral $srcdir/$_installdir/$_destdir $pkgdir/

    #find $pkgdir -type f -exec chmod g+rw {} \;
    #find $pkgdir -type d -exec chmod g+x  {} \;

    install -D -m0644 $srcdir/${_installpath}/${_tooldir}/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

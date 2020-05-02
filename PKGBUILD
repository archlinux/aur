# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=20.2.1.LTS
_manifest_ver=20.2.0.LTS
pkgrel=1
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM"
arch=('x86_64')
url="http://www.ti.com/tool/ARM-CGT"
license=('custom')

# lib32-glibc needed for the installer
makedepends=('lib32-glibc' 'lib32-fakeroot')

optdepends=('ccstudio')

_installer="ti_cgt_tms470_${pkgver}_linux_installer_x86.bin"
source=("http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${pkgver}/${_installer}")

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsdir=opt/ccstudio
_installdir=ccs/tools/compiler

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    echo ">>> Running installer..."
    echo ">>> Errors about acl like below are harmless (please ignore):"
    echo ">>>   dlsym(acl_get_fd): /usr/lib32/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd"

    ./${_installer} --mode unattended --prefix $pkgdir/${_ccsdir}/${_installdir}

    # Match permissions to ccstudio package (see notes in ccstudio.install)
    find $pkgdir/${_ccsdir} -type d -exec chmod 0775 {} \;

    install -D -m0644 $pkgdir/${_ccsdir}/${_installdir}/${pkgname}_${pkgver}/ARM_RTS_${_manifest_ver}_manifest.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

sha256sums=('fda075c64a7a1367c78d6c7c908b15f4de023112f03a4b96291ba9cd03b35808')

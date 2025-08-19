# Maintainer:  Phillip S. Kajubi <pintert3 at kalabentate dot com>
# Contributor:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm-clang
_partpkgver=4.0.3
pkgver=${_partpkgver}.LTS
pkgrel=2
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM (CLANG) LTS"
arch=('x86_64')
url="http://www.ti.com/tool/ARM-CGT"
license=('LicenseRef-multiple-licenses')

depends=('gcc-libs' 'nodejs')
conflicts=('ccstudio') # current package ships with the toolchains

_installer="ti_cgt_armllvm_${pkgver}_linux-x64_installer.bin"
source=("https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-ayxs93eZNN/${pkgver}/${_installer}")
sha256sums=('617b0379a0f0aaac364d6b16f0ea899687ebf7f773a840d1c7d6f0691205919c')

options=(!strip libtool staticlibs emptydirs !purge !zipman)

# I intend to separate it from ccstudio
# _ccsdir=opt/ccstudio
# _installdir=ccs/tools/compiler
_tidir=opt/ti
_installdir=tools/compiler

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    echo ">>> Running installer..."

    ./${_installer} --mode unattended --prefix $pkgdir/${_tidir}/${_installdir}

    # Match permissions to ccstudio package (see notes in ccstudio.install)
    find $pkgdir/${_tidir} -type d -exec chmod 0775 {} \;

    install -D -m0644 $pkgdir/${_tidir}/${_installdir}/ti-cgt-armllvm_${pkgver}/TI_Arm_Clang_Compiler_${_partpkgver}_manifest.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

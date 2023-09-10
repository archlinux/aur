# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=20.2.7.LTS
pkgrel=3
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM"
arch=('x86_64')
url="http://www.ti.com/tool/ARM-CGT"
license=('custom')

#optdepends=('ccstudio')
conflicts=('ccstudio') # current package ships with the toolchains

_installer="ti_cgt_tms470_${pkgver}_linux-x64_installer.bin"
source=("https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-sDOoXkUcde/${pkgver}/${_installer}")
md5sums=('b629994a0d2577f8ac65855cc1a80631') # TI website provides the MD5 sum specifically

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsdir=opt/ccstudio
_installdir=ccs/tools/compiler

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    echo ">>> Running installer..."

    ./${_installer} --mode unattended --prefix $pkgdir/${_ccsdir}/${_installdir}

    # Match permissions to ccstudio package (see notes in ccstudio.install)
    find $pkgdir/${_ccsdir} -type d -exec chmod 0775 {} \;

    install -D -m0644 $pkgdir/${_ccsdir}/${_installdir}/${pkgname}_${pkgver}/ARM_RTS_${pkgver}_manifest.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-rtos-cc13xx-cc26xx
pkgver=2.21.01.08
_pkgver=2_21_01_08
pkgrel=1
pkgdesc="Texas Instruments Real-Time Operating System (TI-RTOS) for CC12xx and CC26xx Microcontrollers"
arch=('x86_64')
url="http://www.ti.com/tool/ti-rtos-mcu"
license=('custom')

depends=('python2-lxml')
optdepends=('ccstudio')

# Specify provided version, because other TI tools (ti-ble-sdk) might be
# released with a specific version (doesn't mean it won't work with newer
# versions of the dependency, but at least give the other PKGBUILD a
# way to depend on specific version if it is necessary.
provides=("$pkgname=$pkgver")

_bundle=tirtos_cc13xx_cc26xx_$_pkgver
_installer=tirtos_cc13xx_cc26xx_setuplinux_$_pkgver.bin

# Installer mirrored on IPFS
_ipfs_hash=QmXWp5HwPfawjchpvAmsfAn5553FCZYTXVwps3H29imABN

source=("http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/tirtos/${_pkgver}/exports/${_installer}"
        # Alternative source for same file
	#"https://gateway.ipfs.io/ipfs/${_ipfs_hash}/${_installer}"
	)

options=(!strip libtool staticlibs emptydirs !purge !zipman)

# install into CCS parent directory for CCS to find it automatically
_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installpath=$_installdir/$_destdir/$_ccsdir

prepare() {
    cd $srcdir
}

build() {
    cd $srcdir

    chmod +x ./${_installer}
    ./${_installer} --mode unattended --prefix $srcdir/${_installpath}
}

package() {
    cd $srcdir

    cp -al $srcdir/${_installdir}/${_destdir} $pkgdir

    install -D -m0644 $srcdir/${_installpath}/${_bundle}/docs/tirtos_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('95f58837d98983bf24bf8717dc5e0ad1c8d132858f7a7fce1b263037f0e86872')

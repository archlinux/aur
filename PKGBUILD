# Maintainer: Christopher Bero <bigbero@gmail.com>
# Taken from https://aur.archlinux.org/packages/mspds
# PKGBUILD copied from https://github.com/greigdp/msp430-mspds
pkgname=mspds
pkgver=3.05.01.01
pkgrel=1
pkgdesc="MSP430 Debug Stack. Contains a dynamic link library as well as embedded firmware that runs on the MSP-FET430UIF or the eZ430 emulators."
arch=('i686' 'x86_64')
url="http://processors.wiki.ti.com/index.php/MSPDS_Open_Source_Package"
license=('custom:TI Open Source')
group=('msp430')
depends=('hidapi' 'boost')
makedepends=('unzip' 'dos2unix')
optdepends=('mspdebug')
noextract=('slac460n.zip')
source=('http://www.ti.com/lit/sw/slac460n/slac460n.zip'
        'hidapi.patch')

sha256sums=('181418a33400567fa19e411f16df340a2869dd87e941e517732280004ee0fed7'
            'e2bb2522f34e37ad91b6713c28e267e5e40591a4508ae315fcaea6c2103bb9e3')

prepare() {
    unzip slac460n.zip
    find ./MSPDebugStack_OS_Package/ -type f -exec dos2unix -q '{}' \;
    patch -p1 -d MSPDebugStack_OS_Package < ../hidapi.patch
}

build() {
    cd "$srcdir/MSPDebugStack_OS_Package"
    # The -j flag is the number of parallel jobs to run, adjust accordningly for yourself
    make -j 3
}

package() {
    install -Dm644 "$srcdir/MSPDebugStack_OS_Package/libmsp430.so" "$pkgdir/usr/lib/libmsp430.so"
}

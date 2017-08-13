# Maintainer: Christopher Bero <bigbero@gmail.com>
# Taken from https://aur.archlinux.org/packages/mspds
# PKGBUILD copied from https://github.com/greigdp/msp430-mspds
# Contributor: Alexei Colin <ac@alexeicolin.com>
pkgname=mspds
pkgver=3.10.001.000
pkgrel=1
pkgdesc="MSP430 Debug Stack. Contains a dynamic link library as well as embedded firmware that runs on the MSP-FET430UIF or the eZ430 emulators."
arch=('i686' 'x86_64')
url="http://www.ti.com/tool/mspds"
# Licenses were found in "Manifest MSPDebugStack OS Package.pdf" from the mspds source archive.
license=('custom:TI BSD' 'custom:IAR BSD' 'custom: TI TSPA')
group=('msp430')
depends=('hidapi' 'boost')
makedepends=('unzip' 'dos2unix')
optdepends=('mspdebug')
_release='slac460v'
_releasefile="${_release}.zip"
noextract=("${_releasefile}")
source=("http://www.ti.com/lit/sw/${_release}/${_releasefile}"
        'hidapi.patch')

sha256sums=('37b49f06ff4700f7eb43cc470bd5203a92955572fd9b43003630febfa0264e01'
            'aa2bdb86118a84423f3df752f48d90d2ebcb1e1bbc5293bdfd7fb1c62f765a34')

prepare() {
    unzip ${_releasefile}
    find ./ -type f -exec dos2unix -q '{}' \;
    # This hidapi patch allows us to build mspds from the hidapi Archlinux package rather than the v0.7 source.
    patch -p1 -d . < ../hidapi.patch
}

build() {
    cd "$srcdir"
    make
}

package() {
    install -Dm644 "$srcdir/libmsp430.so" "$pkgdir/usr/lib/libmsp430.so"
}

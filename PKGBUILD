# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=brother-ql650td-cupswrapper
_pkgname=ql650tdcupswrapper
pkgver=1.0.1
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother P-Touch QL-650TD labelprinter (metric)"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
if [[ $CARCH == 'x86_64' ]]; then
  depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-ql650td-lpr')
else
  depends=('cups' 'ghostscript' 'glibc' 'brother-ql650td-lpr')
fi
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-0.i386.rpm"
        "cupswrapper.install")
sha256sums=('0aa08b6214de134ed6828fef8ea6ae1975077947a577f62904d3e618d3f4c7b0'
            '9125eb3011e85c1b77d84c88c7ba076b27d86991d3b80db0e868909b75742049' )
noextract=("${_pkgname}-${pkgver}-0.i386.rpm")
install='cupswrapper.install'

build() {
        cd $srcdir
        rpmextract.sh "${_pkgname}-${pkgver}-0.i386.rpm"

        rm -f ${_pkgname}-${pkgver}-0.i386.rpm

        mkdir -p usr/share/ || return 1
        rm -rf usr/share/brother 
        mv opt/brother usr/share/brother || return 1
        rmdir opt || return 1

        sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' ./` || return 1
}

package() {
	mv usr $pkgdir/. || return 1
}

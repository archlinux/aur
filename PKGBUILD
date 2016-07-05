# Maintainer: zoe <chp321@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
pkgname=brother-ql500-cupswrapper
_pkgname=ql500cupswrapper
pkgver=1.0.1
pkgrel=8
pkgdesc="LPR-to-CUPS wrapper for Brother P-Touch QL-500 labelprinter (metric)"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
if [[ $CARCH == 'x86_64' ]]; then
  depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-ql500-lpr')
else
  depends=('cups' 'ghostscript' 'glibc' 'brother-ql500-lpr')
fi
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-0.i386.rpm"
        "cupswrapper.install")
md5sums=('1bc83941faf4a927f62cf96af2c12aee'
         '15f26fd4fad037db015fd95bf5ed58b9' )
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


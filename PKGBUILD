# Maintainer: zoe <chp321@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
pkgname=brother-ql500-cupswrapperinch
_pkgname=ql500cupswrapperinch
pkgver=1.0.0
pkgrel=7
pkgdesc="LPR-to-CUPS wrapper for Brother P-Touch QL-500 labelprinter (imperial)"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
if [[ $CARCH == 'x86_64' ]]; then
  depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-ql500-lpr')
else
  depends=('cups' 'ghostscript' 'glibc' 'brother-ql500-lpr')
fi
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-1.redhat.i386.rpm"
        "cupswrapper.install")
md5sums=('4040ef6abc7966ee2fa850b611948545'
         '83cafa21ea6766b3373fe0643ce9267b')
noextract=("${_pkgname}-${pkgver}-1.redhat.i386.rpm")
install='cupswrapper.install'

build() {
        cd $srcdir
        rpmextract.sh "${_pkgname}-${pkgver}-1.redhat.i386.rpm"

        rm -f ${_pkgname}-${pkgver}-1.redhat.i386.rpm

        mkdir -p usr/share/ || return 1
        rm -rf usr/share/brother 
        mv usr/local/Brother usr/share/brother || return 1
        rmdir usr/local || return 1

        sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./` || return 1
}

package() {
	mv usr $pkgdir/. || return 1
}


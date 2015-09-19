# Maintainer: Michael Heyns <beanaroo@gmail.com>

pkgname="brother-mfc-j265w"
pkgver="1.1.3"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J265W"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license='unknown'
install='brother-mfc-j265w.install'
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
source=(
	"http://download.brother.com/welcome/dlf006542/mfcj265wlpr-1.1.3-1.i386.deb"
	"http://download.brother.com/welcome/dlf006544/mfcj265wcupswrapper-1.1.3-1.i386.deb"
)
md5sums=('036138c0f659283aa492eddb1495edf6'
         'c1459408fbf72a588d72a4048cb801de')

build() {
	deb2targz *.deb >/dev/null || return 1
	rm -f *.deb || return 1
}

package() {
	cd $srcdir || return 1
	[ -d "mfcj265w" ] || (mkdir mfcj265w || return 1)
	for i in *.tar.gz;do tar xfz $i -C mfcj265w;done || return 1
	cd mfcj265w || return 1
	cd usr/local/Brother/Printer/mfcj265w || return 1
	perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcj265w || return 1
	perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij || return 1
	cp -rf $srcdir/mfcj265w/usr/ $pkgdir/ || return 1
}

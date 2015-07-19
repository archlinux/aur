# Contributor: Simon Parzer <simon.parzer@gmail.com>
pkgname=larn
pkgver=20090906
pkgrel=1
pkgdesc="a roguelike computer game authored by Noah Morgan in 1986 for the UNIX operating system"
arch=("i686" "x86_64")
license=('BSD')
url="http://www.netbsd.org"
depends=('ncurses')
makedepends=('cvs')
source=('larn-bsdtolinux.diff')
md5sums=('fd26cceed04e59ade0e9ec85d721d7c5')

build() {
_cvsroot=":pserver:anoncvs@anoncvs.NetBSD.org:/cvsroot"
_cvsmod="src/games/larn"

cd ${srcdir}
msg "Connecting to NetBSD CVS server..."
if [ -d $_cvsmod/CVS ]; then
	cd $_cvsmod
	cvs -z3 update -d
else
	cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
	cd $_cvsmod
fi
patch -Np1 -i ${srcdir}/larn-bsdtolinux.diff
make || return 1
mkdir -p ${pkgdir}/usr/bin
install -Dm755 larn ${pkgdir}/usr/bin/larn || return 1
install -Dm644 datfiles/larn.help ${pkgdir}/usr/share/larn/larn.help || return 1
install -Dm644 datfiles/larnmaze ${pkgdir}/usr/share/larn/larnmaze || return 1
gzip larn.6 || return 1
install -Dm644 larn.6.gz ${pkgdir}/usr/share/man/man6/larn.6.gz || return 1
install -Dm644 README ${pkgdir}/usr/share/doc/larn/README || return 1
install -Dm644 datfiles/larnopts ${pkgdir}/usr/share/doc/larn/larnopts || return 1
install -Dm644 Fixed.Bugs ${pkgdir}/usr/share/doc/larn/Fixed.Bugs || return 1
}

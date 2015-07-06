pkgname=golded-plus-cvs
pkgver=20091209
pkgrel=2
pkgdesc="This is a successor of the well-known GoldED Fidonet Mail Reader/Editor"
arch=('i686' 'x86_64')
url="http://bbconf.sourceforge.net/"
license=('GPL2')

makedepends=('cvs' 'gcc' 'make')
provides=('golded-plus')

_cvsroot=":pserver:anonymous@golded-plus.cvs.sourceforge.net:/cvsroot/golded-plus"
_cvsmod="golded+"

options=('!libtool')
package() {
	msg "Performing source checkout..."
	if [ -d "$_cvsmod/CVS" ]; then
		cd "$_cvsmod"
		cvs -z3 update -d || return 1
		cd ..
	else
		cvs -z3 -d $_cvsroot co -D $pkgver -f "$_cvsmod" || return 1
	fi
	msg "Source checkout finished."
	rm -rf "$_cvsmod-build"
	cp -r "$_cvsmod" "$_cvsmod-build" || return 1
	cd "$_cvsmod-build"
	cp golded3/mygolded.__h golded3/mygolded.h || return 1
	make || return 1
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 bin/{gedlnx,golded,gnlnx,rddtlnx} ${pkgdir}/usr/bin/
}

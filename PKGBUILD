# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>
pkgname=javapsionlink-cvs
pkgver=2.0_beta1
pkgrel=2
pkgdesc="Data transfer between Psion EPOC PDA and PC via RS-232; PsiWin clone"
arch=('any')
url="http://littlespikeyland.com/psionlink/"
license=('LGPL')
depends=('java-runtime' 'java-rxtx')
makedepends=('java-environment' 'cvs' 'apache-ant')
install="javapsionlink.install"
source=(replace-javax.comm.patch
        remove-beanshell-classpath.patch
        javapsionlink.desktop
        javapsionlink.sh)
md5sums=('29ac8e314bc13e912f74ebeee340ac88'
         '9c1f3669a4ed6ef1ee0a6940be7f2cf2'
         '20581709a51cbad21029bc8b829ae1df'
         '8d8ec03c8acf71f12b70794187286c94')

build() {
	if [ -d $srcdir/javapsionlink/CVS ]; then
		cd $srcdir/javapsionlink
		cvs -q update
	else
		cvs -z3 -d:pserver:anonymous:@javapsionlink.cvs.sourceforge.net:/cvsroot/javapsionlink checkout -P javapsionlink
		cd $srcdir/javapsionlink
		patch -p1 < $srcdir/replace-javax.comm.patch
		patch -p1 < $srcdir/remove-beanshell-classpath.patch
	fi
	ant -lib /usr/share/java/rxtx/ jar || return 1
	install -D -m644 dist/jpl2.jar $pkgdir/usr/share/java/javapsionlink/jpl2.jar
	install -D -m644 icon.gif $pkgdir/usr/share/pixmaps/javapsionlink.gif
	install -D -m644 $srcdir/javapsionlink.desktop $pkgdir/usr/share/applications/javapsionlink.desktop
	install -D -m755 $srcdir/javapsionlink.sh $pkgdir/usr/bin/jpl2
}

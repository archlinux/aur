# Original Maintainer: Adam Eberlin <ae at intellitech dot org>
# Current Maintainer: Leopold Bloom <blinxwang at gmail dot com>

pkgname=lc3tools
pkgver=12
pkgrel=3
pkgdesc="Unix LC-3 Simulator from McGraw-Hill Higher Education"
arch=('i686' 'x86_64')
url="http://highered.mcgraw-hill.com/sites/0072467509/student_view0/"
license=('LGPL')
depends=('unzip' 'tk')
makedepends=()
provides=("lc3sim=$pkgver")
replaces=()
conflicts=()
options=('!libtool')
source=("http://highered.mheducation.com/sites/dl/free/0072467509/104652/lc3tools_v$pkgver.zip")
md5sums=('40bfed95f05b50d5378912f7bbc03164')

build()
{
	cd ${srcdir}/lc3tools

	msg "Building lc3tools..."

	./configure --installdir /usr/lib/lc3tools --prefix=/usr || return 1
	make || return 1

	msg "Fixing a few path issues..."

	cp ${srcdir}/lc3tools/lc3sim-tk ${srcdir}/lc3tools/lc3sim-tk.bak

	sed "s;`echo ${srcdir}/lc3tools/lc3sim | sed 's/\//\\//g'`;`echo /usr/bin/lc3sim | sed 's/\//\\//g'`;g" ${srcdir}/lc3tools/lc3sim-tk.bak > ${srcdir}/lc3tools/lc3sim-tk

	msg "Done."
}

package()
{
	install -m644 -D ${srcdir}/lc3tools/CHANGE_LOG ${pkgdir}/usr/share/lc3tools/CHANGE_LOG
	install -m644 -D ${srcdir}/lc3tools/COPYING ${pkgdir}/usr/share/licenses/lc3tools/COPYING
	install -m644 -D ${srcdir}/lc3tools/NO_WARRANTY ${pkgdir}/usr/share/licenses/lc3tools/NO_WARRANTY
	install -m644 -D ${srcdir}/lc3tools/README ${pkgdir}/usr/share/lc3tools/README
	install -m755 -D ${srcdir}/lc3tools/lc3as ${pkgdir}/usr/bin/lc3as
	install -m755 -D ${srcdir}/lc3tools/lc3convert ${pkgdir}/usr/bin/lc3convert
	install -m755 -D ${srcdir}/lc3tools/lc3sim ${pkgdir}/usr/bin/lc3sim
	install -m755 -D ${srcdir}/lc3tools/lc3sim-tk ${pkgdir}/usr/bin/lc3sim-tk
	mkdir -p ${pkgdir}/usr/lib/lc3tools
	install -m755 -D ${srcdir}/lc3tools/lc3os.obj ${pkgdir}/usr/lib/lc3tools/lc3os.obj
	install -m755 -D ${srcdir}/lc3tools/lc3os.sym ${pkgdir}/usr/lib/lc3tools/lc3os.sym
	cd ${pkgdir}/usr/lib/lc3tools
	ln -s ../../bin/lc3sim ./lc3sim
}
